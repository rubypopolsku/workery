class ContactMessagesController < ApplicationController
  def new
    @contact_message = ContactMessage.new
  end

  def create
    unless params[:contact_message][:terms] == "1"
      flash[:notice] = 'Musisz wyraźić zgodę na przetwarzanie danych'
    else
      @contact_message = ContactMessage.new(message_params)

      if @contact_message.save
        ContactMailer.contact_message(@contact_message).deliver_now
        flash[:notice] = 'Wiadomość zapisana'
      else
        flash[:notice] = 'Coś poszło nie tak'
      end
    end

    redirect_to new_contact_message_path
  end

  private

  def message_params
    params.require(:contact_message).permit(:name, :email, :title, :body)
  end
end
