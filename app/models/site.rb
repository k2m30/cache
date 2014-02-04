class Site < ActiveRecord::Base
  has_one :banner
  has_many :externals
  accepts_nested_attributes_for :banner, allow_destroy: true
end
