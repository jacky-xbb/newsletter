class NewsletterMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.email.subject
  #
  def email(subscriber, email)
    @subscriber = subscriber
    @email = email

    mail to: @subscriber.email, subject: @email.subject
  end
end
