class ServiceRequest < ApplicationRecord
  belongs_to :user
  belongs_to :premise
  belongs_to :vendor
  has_one :bill
end
