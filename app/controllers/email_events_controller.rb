class EmailEventsController < ApplicationController
  include EmailEventsHelper

  def index
    @email_events = EmailEvent.all
  end

  def create
    email_event = EmailEvent.new(email_params)
    render json: email_event if email_event.save
  end
end
