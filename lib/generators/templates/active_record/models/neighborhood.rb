# Neighborhood model
# name:string
# zip_code:string
# city_id:integer
# state_id:integer
class Neighborhood < ActiveRecord::Base
  validates :name, :zip_code, presence: true

  belongs_to :city
  belongs_to :state

  delegate :name, to: :city, prefix: true
  delegate :name, to: :state, prefix: true
end
