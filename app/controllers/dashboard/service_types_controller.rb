class Dashboard::ServiceTypesController < ApplicationController
  DASHBOARD_SERVICE_TYPES_COUNT = 4
  def index
    render json: payload,
           status: :ok
  end

  private

  def payload
    ActiveModelSerializers::SerializableResource.new(
      service_types,
      each_serializer: Dashboard::ServiceTypeSerializer,
      adapter: :json,
      root: 'data'
    ).as_json[:data]
  end

  def service_types
    ServiceType.find_by_sql(
      <<-sql
        select st.*
        from service_types st
        where exists(select 1 from service_requests sr where sr.service_type_id = st.id)
        limit 5
    sql
    )
  end
end
