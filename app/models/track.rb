class Track < ApplicationRecord
  has_many :set_list_tracks
  has_many :setlists, through: :set_list_tracks
end
