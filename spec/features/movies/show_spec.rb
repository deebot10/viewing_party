require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  before(:each) do
    @user = User.create(username: 'test_user', email: 'user@test.com', password: 'test_password')
    @user.authenticate(@user.password)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit movie_path(550)
  end

  it 'Displays the movies and all movie attributes' do
    
    expect(page).to have_content("Welcome #{@user.username}!")
    expect(page).to have_content('Fight Club')
    expect(page).to have_content('Vote Average: 8.4')
    expect(page).to have_content('Runtime: 139')
    expect(page).to have_content('Genre(s): Drama')
    expect(page).to have_content('A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.')
    expect(page).to have_content('Edward Norton, Brad Pitt, Helena Bonham Carter, Meat Loaf, Jared Leto, Zach Grenier, Holt McCallany, Eion Bailey, Richmond Arquette, David Andrews')
    expect(page).to have_content('7 Reviews')
    expect(page).to have_content('Review: Pretty awesome movie. It shows what one crazy person can convince other crazy people to do. Everyone needs something to believe in. I recommend Jesus Christ, but they want Tyler Durden.')
  end

  it 'has a button to create a viewing party' do

    expect(page).to have_button('Create Viewing Party for Movie')

    click_button 'Create Viewing Party for Movie'

    expect(current_path).to eq(new_party_path(@user))
  end
end