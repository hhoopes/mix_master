require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the page for all the artists" do
    many_artists
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit artists_path

    ["Duran Duran", "Michael Jackson", "Depeche Mode"].each do |artist|
      expect(page).to have_content artist
    end

    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
