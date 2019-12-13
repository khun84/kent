class Dashboard::ActivityFeedsController < ApplicationController
  DASHBOARD_ACTIVITIES_FEED_COUNT = 10
  def index
    render json: payload,
           status: :ok
  end

  private

  def payload
    ActiveModelSerializers::SerializableResource.new(
      activities_feed,
      each_serializer: Dashboard::ActivityFeedSerializer,
      adapter: :json,
      root: 'data'
    ).as_json[:data]
  end

  def activities_feed
    [
      ActivityFeed.new(detail: Faker::Lorem.sentence, activity_type: activity_type, created_at: rand(10).days.ago),
      ActivityFeed.new(detail: Faker::Lorem.sentence, activity_type: activity_type, created_at: rand(10).days.ago),
      ActivityFeed.new(detail: Faker::Lorem.sentence, activity_type: activity_type, created_at: rand(10).days.ago),
      ActivityFeed.new(detail: Faker::Lorem.sentence, activity_type: activity_type, created_at: rand(10).days.ago),
      ActivityFeed.new(detail: Faker::Lorem.sentence, activity_type: activity_type, created_at: rand(10).days.ago),
      ActivityFeed.new(detail: Faker::Lorem.sentence, activity_type: activity_type, created_at: rand(10).days.ago)
    ].sort_by(&:created_at).reverse
  end

  def activity_type
    rand > 0.5 ? :request : :payment
  end
end
