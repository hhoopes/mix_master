class Song < ActiveRecord::Base
  belongs_to :artist

  def self.alphabetized
    Song.order(title: :asc).all
  end
end
