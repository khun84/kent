class User < ApplicationRecord
  belongs_to :organization
  has_many :premises
end