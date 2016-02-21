FactoryGirl.define do
  factory :song do
    title  { Faker::Book.title }
  end

  factory :artist do
    name        { Faker::Name.name }
    image_path   "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  end

  # factory :artist_with_songs, :parent => :artist do |artist|
  #   artist.after(:create) do |artist|
  #     artist.songs << FactoryGirl.create(:song)
  #   end
  # end


  # factory :song do
  #   title Faker::Book.title
  #   artist
  # end
  #
  #   factory :artist do
  #     name         Faker::Name.name
  #     image_path   "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
  #
  #
  #     factory :artist_with_songs do
  #       transient do
  #         songs_count 3
  #       end
  #
  #       after(:create) do |artist, evaluator|
  #         create_list(:song, evaluator.songs_count, artist: artist)
  #     end
  #   end
  # end
end
