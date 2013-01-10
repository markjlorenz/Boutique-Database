class Store < ActiveRecord::Base
  has_many :designers_stores, :dependent=>:destroy, :autosave=>true#,:inverse_of=>:store
  has_many :designers, :through=>:designers_stores
  accepts_nested_attributes_for :designers_stores, reject_if:proc{|attrs| attrs[:designer_attributes][:name].blank? && attrs[:designer_id].blank?}, allow_destroy:true

  #accepts_nested_attributes_for :designers, reject_if:proc{|attrs| reject = %w(name).all?{|a| attrs[a].blank?}}

  has_many :touches, :dependent=>:destroy
  accepts_nested_attributes_for :touches

  has_many :campaigns, :through=>:touches

  has_many :employees, :dependent=>:destroy
  accepts_nested_attributes_for :employees, reject_if:proc{|attrs| reject = %w(name).all?{|a| attrs[a].blank?}}, allow_destroy:true

  def descr
    name + " - " + id.to_s
  end

  def campaign_touched? campaign
    self.touches.map(&:campaign_id).include?(campaign.id)
  end

end

