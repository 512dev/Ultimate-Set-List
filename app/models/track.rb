class Track < ApplicationRecord
  has_many :set_list_tracks
  has_many :setlists, through: :set_list_tracks
  validates_uniqueness_of :spotify_track_id, scope: [:setlist_id]

  # def self.find_or_create_by(*)
  # 	super
		# rescue ActiveRecord::RecordNotUnique
  # 	retry
  # end
end
