module EmailEventsHelper

  def email_params
    data = JSON.load(request.body)
    {
      address: data['Address'],
      email_type: data['EmailType'],
      event: data['Event'],
      timestamp: Time.at(data['Timestamp'])
    }
  end
end
