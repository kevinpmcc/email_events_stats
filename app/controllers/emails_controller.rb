class EmailsController < ApplicationController

  skip_filter :verify_authenticity_token

  def index
  end

  def create
    email = Email.new(email_params)
    render json: email if email.save
  end

  def email_params
    data = JSON.load(request.body) 
    {
      address: data['Address'],
      email_type: data['EmailType'],
      event: data['Event'],
      timestamp: data['Timestamp']
    }
  end

end

