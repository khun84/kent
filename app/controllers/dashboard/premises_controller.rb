class Dashboard::PremisesController < ApplicationController
  TOP_N_PREMISES = 5
  def index
    render json: payload,
           status: :ok
  end

  private

  def payload
    ActiveModelSerializers::SerializableResource.new(
      premises,
      each_serializer: Dashboard::PremiseSerializer,
      adapter: :json,
      root: 'data'
    ).as_json[:data]
  end

  def premises
    Premise.all.order(:name).take(TOP_N_PREMISES)
  end
end
