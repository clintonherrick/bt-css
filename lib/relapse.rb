class Relapse < ActiveRecord::Base
  belongs_to :addict
  has_and_belongs_to_many :ingredients
end
