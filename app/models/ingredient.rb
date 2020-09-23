class Ingredient < ApplicationRecord
  attr_accessor :like
  validates  :list,    presence: true  
end
