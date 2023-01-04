class ApprovalMailer < ApplicationMailer
  def account_approve(user)
    @user = user.email
    @greeting = "Greetings from ... app team"

    mail to: @user, subject: "Account Approval"
  end
end
