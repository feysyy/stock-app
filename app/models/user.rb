class User < ApplicationRecord
  has_many :stocks
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  validates :role, inclusion: { in: %w(admin trader),
         message: "%{value} is not a valid role" }

  after_commit :send_approval_email, on: [:update], if: -> do
    saved_change_to_attribute?(:approved, from: false, to: true)
  end

  after_commit :send_unapproval_email, on: [:update], if: -> do
    saved_change_to_attribute?(:approved, from: true, to: false)
  end

  def status
    if self.approved
      return "Verified"
    end
      "Pending"
  end

  private

  def send_approval_email
    ApprovalMailer.approval_email(user: self).deliver_now!
  end

  def send_unapproval_email
    ApprovalMailer.unapprove_email(user: self).deliver_now!
  end
end
