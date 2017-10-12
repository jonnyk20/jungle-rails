class Review < ActiveRecord::Base
  belongs_to :product, required: true 
  belongs_to :user, required: true
  validates :description, :rating, presence: true
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }
  validates :user, uniqueness: { scope: :product }
end
