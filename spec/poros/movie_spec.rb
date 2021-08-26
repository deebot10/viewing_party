require 'rails_helper'

RSpec.describe Movie do
  it 'exits' do
    movie = Movie.new({original_title: 'Fight Club',
               overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.",
               vote_average: '8.4',
               genres: ["Drama"],
               cast: [{name: "Edward Norton", character: "The Narrator"}, {name: "Brad Pitt", character: "Tyler Durden"}],
               reviews: [{author: "Goddard", review: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."}, {author: "Brett Pascoe", review: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again."}],
               id: '550',
               runtime: '139'})
    expect(movie).to be_a(Movie)
    expect(movie.title).to eq('Fight Club')
    expect(movie.description).to eq('A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.')
    expect(movie.id).to eq('550')
    expect(movie.rating).to eq('8.4')
    expect(movie.runtime).to eq('139')
  end
end
