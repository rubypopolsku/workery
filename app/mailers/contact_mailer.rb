class ContactMailer < ApplicationMailer
  def contact_message(contact_message)
    @message = contact_message
    mail(to: @message.email, subject: @message.title)
  end
end
