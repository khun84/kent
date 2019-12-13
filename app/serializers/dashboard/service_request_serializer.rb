class Dashboard::ServiceRequestSerializer < ActiveModel::Serializer
  attributes :service_type_name, :service_area_name

  def service_type_name
    object.service_type.name
  end

  def service_area_name
    object.premise.address
  end
end