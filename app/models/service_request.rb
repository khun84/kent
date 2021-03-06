class ServiceRequest < ApplicationRecord
  belongs_to :user
  belongs_to :premise
  belongs_to :vendor
  has_one :bill
  belongs_to :service_type

  enum status: { pending: 1, in_progress: 10, completed: 20 }
end
