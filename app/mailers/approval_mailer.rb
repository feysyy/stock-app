class ApprovalMailer < ApplicationMailer
  layout "approval_email_layout"

  default(
    from: "fey stock app <trading.app.sample4@gmail.com>",
    reply_to: "fey stock app <trading.app.sample4@gmail.com>",
    template_path: "approval_mailer"
  )

  def approval_email(user:)
    @user = user

    mail(
      to: @user.email,
      subject: "Your account has been approved to trade",
      template_name: "approval_email"
    )
  end

  def unapprove_email(user:)
    @user = user

    mail(
      to: @user.email,
      subject: "Your account has been unapproved to trade",
      template_name: "unapprove_email"
    )
  end
end
