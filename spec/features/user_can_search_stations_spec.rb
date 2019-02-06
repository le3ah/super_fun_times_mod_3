require 'rails_helper'

feature 'user can visit root page' do
  scenario 'and fill in search form and should see 10 closest stations' do

  visit '/'
  fill_in :q, with: 80203
  click_on "Locate"
  expect(current_path).to eq("/search")
  expect(page).to have_content("10 Closest Stations")
  expect(page).to have_css(".station", count: 10)

  within(first(".station"))do
    expect(page).to have_css(".name")
    expect(page).to have_css(".address")
    expect(page).to have_css(".fuel_type")
    expect(page).to have_css(".distance")
    expect(page).to have_css(".access_times")
  end

  within(first(".fuel_type"))do
    expect(page).to have_content("ELEC") || have_content("LPG")
    expect(page).to_not have_content("BD")
    expect(page).to_not have_content("CNG")
    expect(page).to_not have_content("E85")
    expect(page).to_not have_content("HY")
    expect(page).to_not have_content("LNG")
  end
  expect(page).to_not have_content("BD")
  expect(page).to_not have_content("CNG")
  expect(page).to_not have_content("E85")
  expect(page).to_not have_content("HY")
  expect(page).to_not have_content("LNG")
  end
end
