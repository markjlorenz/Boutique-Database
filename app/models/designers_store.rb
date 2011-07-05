class DesignersStore < ActiveRecord::Base
  belongs_to :designer#, :inverse_of=>:designers_stores
  belongs_to :store#, :inverse_of=>:designers_stores

  accepts_nested_attributes_for :designer, reject_if:proc{|attrs| %w(name).all?{|a| attrs[a].blank?}}
end
