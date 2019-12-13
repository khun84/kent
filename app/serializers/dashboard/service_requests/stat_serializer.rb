class Dashboard::ServiceRequests::StatSerializer < ActiveModel::Serializer
  attributes :ongoing_count, :completed_count
end