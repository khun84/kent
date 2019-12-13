class Bill < ApplicationRecord
  belongs_to :service_request

  enum status: { open: 1, paid: 100 }
end
