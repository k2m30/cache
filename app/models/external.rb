class External < ActiveRecord::Base
  belongs_to :site
  has_one :internal, dependent: :destroy
  validates :url, presence: { strict: true }, uniqueness: { strict: true }
end
