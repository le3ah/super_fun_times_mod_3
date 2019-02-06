require 'rails_helper'

feature 'user can visit root page' do
  scenario 'and fill in search form'
  it "should see 10 closest stations" do

   visit '/'
  # And I fill in the search form with 80203 (Note: Use the existing search form)
   fill_in :q, with: 80203
  # And I click "Locate"
   click_on "Locate"
  # Then I should be on page "/search"
  expect(current_path).to eq("/search")
  # Then I should see a list of the 10 closest stations within 6 miles sorted by distance

  # And the stations should be limited to Electric and Propane
  # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  end
end
