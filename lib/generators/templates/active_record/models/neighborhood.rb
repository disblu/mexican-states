# Neighborhood model
# name:string
# zip_code:string
# city_id:integer
class Neighborhood < ActiveRecord::Base
  validates :name, :zip_code, presence: true
  belongs_to :city
  has_many :neighborhoods
end
