class Setlist < ApplicationRecord
  belongs_to :venue
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :tracks, through: :set_list_tracks, dependent: :destroy
  has_one :venue
  validates :name, presence: true
  validates :artist, presence: true
end
