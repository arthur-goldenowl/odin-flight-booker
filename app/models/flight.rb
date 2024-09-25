class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings, dependent: :destroy

  validates :start_datetime, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
end