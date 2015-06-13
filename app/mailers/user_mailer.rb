class UserMailer < ActionMailer::Base
  #default from: "from@example.com"
  default from: "bookorderservice@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_announcement.subject
  #
  def notify_announcement(user, message)
    @user = user
    @message = message

    mail to: @user.email#, subject: @message.title
  end
end
