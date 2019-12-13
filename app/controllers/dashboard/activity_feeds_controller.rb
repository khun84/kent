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
    ActivityFeed.all.order(created_at: :desc).take(DASHBOARD_ACTIVITIES_FEED_COUNT)
  end
end
