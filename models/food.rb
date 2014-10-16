class Food < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, :course, :price, presence: true

  has_many(:orders)
  has_many(:parties, :through => :orders)
end 

