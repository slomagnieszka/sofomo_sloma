class Geolocation < ApplicationRecord
  validates :ip,
    presence: true
  validates :ip_type,
    presence: true
  validates :latitude,
    presence: true
  validates :longitude,
    presence: true
end
