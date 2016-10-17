# City model
# name:string
# state_id:integer
class City < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :state
  has_many :neighborhoods
end
