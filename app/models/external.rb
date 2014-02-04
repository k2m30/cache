class External < ActiveRecord::Base
  belongs_to :site
  has_one :internal
end
