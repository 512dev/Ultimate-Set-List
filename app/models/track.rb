class Track < ApplicationRecord
  belongs_to :setlist, through: :set_list_tracks
end
