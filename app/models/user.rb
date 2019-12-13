class User < ApplicationRecord
  belongs_to :organization
  has_many :premises

  enum role: { manager: 1 }
  enum status: { pending: 0, active: 10, dormant: 20 }
end