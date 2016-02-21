require 'rails_helper'

RSpec.feature "User views song index" do
  scenario "they see all the songs sorted alphabetically and linked" do
    artist = create(:artist_with_songs, songs_count: 6)

    visit artists_path
    last_song = artist.songs.last

    visit artist_path(artist)
    click_on "View Songs"

    expect(current_path).to eq(artist_songs_path(artist))
    expect(page).to have_link last_song.title, href: song_path(last_song.id)
  end
end
