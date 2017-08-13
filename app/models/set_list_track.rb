class SetListTrack < ApplicationRecord
	belongs_to :setlist, dependent: :destroy
	belongs_to :track, dependent: :destroy
end
