class Touch < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :store
  belongs_to :employee
  
  validates :store, presence:true
  validates :campaign, presence:true

  accepts_nested_attributes_for :employee, allow_destroy:true, reject_if:proc{|attrs| reject = %w(name).all?{|a| attrs[a].blank?}}
end
