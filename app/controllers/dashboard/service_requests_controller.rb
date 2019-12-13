class Dashboard::ServiceRequestsController < ApplicationController
  TOP_N_REQUESTS = 3
  def show
    render json: payload, status: :ok
  end

  private

  def payload
    ActiveModelSerializers::SerializableResource.new(
        on_going_requests,
        each_serializer: Dashboard::ServiceRequestSerializer,
        adapter: :json,
        root: 'on_going_requests'
    ).as_json.merge(
      ActiveModelSerializers::SerializableResource.new(
        completed_requests,
        each_serializer: Dashboard::ServiceRequestSerializer,
        adapter: :json,
        root: 'completed_requests'
      ).as_json
    )
  end

  def on_going_requests
    ServiceRequest.includes(:service_type, :premise).in_progress.order(require_at: :desc).take(TOP_N_REQUESTS)
  end

  def completed_requests
    ServiceRequest.includes(:service_type, :premise).completed.order(require_at: :desc).take(TOP_N_REQUESTS)
  end
end
