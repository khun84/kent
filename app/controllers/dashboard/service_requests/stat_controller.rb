class Dashboard::ServiceRequests::StatController < ApplicationController
  def show
    render json: stat,
           serializer: Dashboard::ServiceRequests::StatSerializer,
           status: :ok
  end

  private

  def stat
    ServiceRequest.find_by_sql(
      <<-sql
        select 
          count(sr.id) filter (where sr.status = #{ServiceRequest.statuses[:in_progress]}) as ongoing_count,
          count(sr.id) filter (where sr.status = #{ServiceRequest.statuses[:completed]}) as completed_count,
          count(sr.id) as total_count
        from service_requests sr;
      sql
    ).first
  end
end