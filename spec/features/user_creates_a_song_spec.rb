require 'rails_helper'

RSpec.feature "User creates a new song" do
  scenario "they see the song on the page for the artist" do
    artist = create(:artist)
    song_title = "No Woman No Cry"

    visit artist_path(artist)
    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"
save_and_open_page
    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end
end