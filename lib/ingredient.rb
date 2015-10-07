class Ingredients < ActiveRecord::Base
  has_and_belongs_to_many :relapses
end
