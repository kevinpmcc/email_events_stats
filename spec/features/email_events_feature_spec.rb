require 'rails_helper'

feature 'emails' do
  context 'no emails data received' do
    scenario 'it should display heading Email Statistics' do
      visit '/emails'
      expect(page).to have_content 'Email Statistics'
    end
  end
end
