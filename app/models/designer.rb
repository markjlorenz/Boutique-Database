class Designer < ActiveRecord::Base
  has_many :designers_stores, :dependent=>:destroy#, :inverse_of=>:designer
  has_many :stores, :through=>:designers_stores
  
  #key and value methods used to autocomplete.  Can't seem to change the field names for autocomplete
  self.include_root_in_json = false
  def key
    self.id
  end
  def value
    self.name
  end

end
