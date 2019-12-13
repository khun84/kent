class Bill < ApplicationRecord
  belongs_to :service_request

  enum status: { open: 0, paid: 100 }
end
