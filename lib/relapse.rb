class Relapse < ActiveRecord::Base
  belongs_to :addict
  has_and_belongs_to_many :ingredients
  validates(:item, {:presence => true, :length => { :minimum => 1 }})
  before_save(:capitalize_item)

  private

  def capitalize_item
    self.item=(item().split.map {|i| i.capitalize }.join(' '))
  end
end
