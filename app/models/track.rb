class Track < ApplicationRecord
  belongs_to :setlist
  belongs_to :user
end
