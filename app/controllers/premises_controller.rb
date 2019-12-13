class PremisesController < ApplicationController
  before_action :authorize_premise, only: %i[show update destroy]
  def index
    render json: payload,
           status: :ok
  end

  def update
    @premise.update(update_params) if update_params.present?
    render json: @premise, serializer: PremiseSerializer, status: :accepted
  end

  private

  def authorize_premise
    @premise = Premise.find_by(id: params[:id])
    render(json: {error: "Not found"}, status: :not_found) unless @premise
  end

  def payload
    ActiveModelSerializers::SerializableResource.new(
      premises,
      each_serializer: PremiseSerializer,
      adapter: :json,
      root: 'data'
    ).as_json[:data]
  end

  def premises
    Premise.all
  end

  def update_params
    params.permit(
      :image_url,
      :name,
      :address
    ).to_h.reject { |_, v| v.blank? }
  end
end
