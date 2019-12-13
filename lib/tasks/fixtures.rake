namespace :fixture do
  desc 'Create create'
  task :delete, [:environment] do
    models = [ServiceRequest, User, Organization, ServiceType, Bill, ActivityFeed, Premise, Vendor]

    ServiceRequest.transaction do
      models.each do |m|
        m.delete_all
      end
    end
  end
end
