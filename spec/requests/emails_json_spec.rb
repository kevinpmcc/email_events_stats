require "rails_helper"

RSpec.describe "Emails", :type => :request do

  it "creates an email" do
    headers = { "CONTENT_TYPE" => "application/json" }
    post "/emails", '{"Address":"barney@lostmy.name","EmailType":"Shipment","Event":"send","Timestamp":1471435479}', headers
    expect(response.status).to eq(200)
  end

end
