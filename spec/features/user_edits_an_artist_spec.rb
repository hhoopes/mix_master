require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they click the edit link and submit valid edits" do
    many_artists
    artist = Artist.last

    visit artist_path(artist.id)
    click_on "Edit"
    expect(current_path).to eq(edit_artist_path(artist.id))

    fill_in "artist_name", with: "Eminem"
    fill_in "artist_image_path", with: "http://www.teambackpack.net/wp-content/uploads/Eminem-.jpg"
    click_on "Update Artist"
    expect(current_path).to eq(artist_path(artist.id))
  end

  context "they try to edit with an existing artist name" do
    scenario "they receive an error message" do
      many_artists
      artist = Artist.last
      visit edit_artist_path(artist.id)

      fill_in "artist_name", with: "Duran Duran"
      fill_in "artist_image_path", with: "http://www.teambackpack.net/wp-content/uploads/Eminem-.jpg"
      click_on "Update Artist"
      
      expect(current_path).to eq(artist_path(artist.id))
      expect(page).to have_content "Name has already been taken"
      visit artists_path
    end
  end
end
