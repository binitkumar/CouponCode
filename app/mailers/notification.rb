class Notification < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.referal.subject
  #
  def referal(referal_code)
    @referal_code = referal_code

    mail to: referal_code.email
  end
end
