class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :doses, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
end
