class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role, inclusion: { in: %w(admin trader),
         message: "%{value} is not a valid role" }

  def status
    if self.approved
      return "Verified"
    end
      "Pending"
  end
end
