class ActivityFeed < ApplicationRecord
  enum activity_type: { request: 1, payment: 10 }
end
