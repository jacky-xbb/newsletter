class EmailsController < ApplicationController
  before_action :set_email, only: %i[show]

  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end

  # GET /emails/1 or /emails/1.json
  def show; end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # POST /emails or /emails.json
  def create
    @email = Email.new(email_params)
    if @email.save
      Subscriber.all.each do |subscriber|
        NewsletterMailer.email(subscriber, @email).deliver_now
      end
      redirect_to emails_path, notice: 'Email send'
    else
      rendder :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_email
    @email = Email.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def email_params
    params.require(:email).permit(:subject, :body, :template_id)
  end
end
