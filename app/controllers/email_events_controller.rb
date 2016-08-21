class EmailEventsController < ApplicationController

  def index
    @email_events = EmailEvent.all
  end

  def create
    email = EmailEvent.new(email_params)
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
