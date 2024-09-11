class Message < ApplicationRecord
  belongs_to :room

  validates :user, presence: true
  validates :message, presence: true
end
