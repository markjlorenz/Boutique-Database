class Employee < ActiveRecord::Base
  belongs_to :store
  has_many :touches
  accepts_nested_attributes_for :touches

  has_many :contacts, :dependent=>:destroy
  accepts_nested_attributes_for :contacts


  #key and value methods used to autocomplete.  Can't seem to change the field names for autocomplete
  self.include_root_in_json = false
  def key
    self.id
  end
  def value
    self.name
  end

end
