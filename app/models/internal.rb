class Internal < ActiveRecord::Base
  belongs_to :external
  validates :url, presence: { strict: true }, uniqueness: { strict: true }
end
