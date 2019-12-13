class Dashboard::ActivityFeedSerializer < ActiveModel::Serializer
  attributes :detail, :activity_type, :created_at
end
