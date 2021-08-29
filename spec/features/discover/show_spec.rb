require 'rails_helper'

RSpec.describe 'Discover page' do
  it 'has a form to search for a movie by its title' do
    visit discover_path
    expect(page).to have_field(:search)
  end

  it 'has a button to display the top 40 movies page' do
    visit discover_path
    expect(page).to have_button("Discover Top 40 Movies")

    click_on("Discover Top 40 Movies")

    expect(current_path).to eq(movies_path)
  end
end
