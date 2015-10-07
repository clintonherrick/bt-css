class Addict < ActiveRecord::Base
  has_many(:relapses)
  validates(:name, {:presence => true })
end
