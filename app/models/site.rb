class Site < ActiveRecord::Base
  has_one :banner, dependent: :destroy
  has_many :externals, dependent: :destroy
  accepts_nested_attributes_for :banner, allow_destroy: true

  validates :name, :css, presence: { strict: true }
  validates :name, uniqueness: { strict: true }
end
