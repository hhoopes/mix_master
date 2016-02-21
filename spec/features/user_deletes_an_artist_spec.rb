require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they click the delete button on an artist page" do
    many_artists
    artist = Artist.last

    visit artists_path
    click_on artist.name

    expect(current_path).to eq artist_path(artist.id)

    click_on "Delete"
    expect(current_path).to eq artists_path
  end
end
