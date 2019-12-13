# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

organization = Organization.create(name: 'Foo', address: Faker::Address.full_address)

# Seed users
user_1 = User.create(
  name: Faker::Name.name,
  role: :manager,
  organization: organization,
  status: :active,
  email: Faker::Internet.email,
  primary: true
)

user_2 = User.create(
  name: Faker::Name.name,
  role: :manager,
  organization: organization,
  status: :active,
  email: Faker::Internet.email,
  primary: false
)

user_3 = User.create(
  name: Faker::Name.name,
  role: :manager,
  organization: organization,
  status: :active,
  email: Faker::Internet.email,
  primary: false
)

# Seed service types
service_types = [
  ["Renovation", "https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"],
  ["Cleaning", "https://as1.ftcdn.net/jpg/02/07/87/26/500_F_207872694_GXB8lLiCdlHyV0Pyq8863MpN7HXFAGCH.jpg"],
  ["Plumbing", "https://as2.ftcdn.net/jpg/02/16/28/29/500_F_216282910_yjxZDV8zDD2FaaBzxaQcNBhFMnmpuoFj.jpg"],
  ["Pest", "https://as1.ftcdn.net/jpg/02/58/38/08/500_F_258380829_bVnmzw13cuqtaSB0vPTfrggQjoEfp8lG.jpg"],
  ["Courier", "https://as1.ftcdn.net/jpg/02/95/78/66/500_F_295786658_6xKWXMiEcGUKlxPSNb6bQhvisIPGFBvC.jpg"],
  ["Electric", "https://as2.ftcdn.net/jpg/02/77/44/49/500_F_277444954_bjewsE0rSMdo0QiBdsAUWCjZW7cYBXfd.jpg"]
]

service_types.each do |name, url|
  ServiceType.create(
    name: name,
    url: url
  )
end

# Seed premises

premise_1 = Premise.create(
  name: Faker::Address.name,
  address: Faker::Address.full_address,
  organization: organization,
  user: user_1
)

premise_2 = Premise.create(
  name: Faker::Address.name,
  address: Faker::Address.full_address,
  organization: organization,
  user: user_1
)

premise_3 = Premise.create(
  name: Faker::Address.name,
  address: Faker::Address.full_address,
  organization: organization,
  user: user_2
)

premise_4 = Premise.create(
  name: Faker::Address.name,
  address: Faker::Address.full_address,
  organization: organization,
  user: user_3
)

# Seed vendors
vendor_1 = Vendor.create(
  name: Faker::Name.name
)

vendor_2 = Vendor.create(
  name: Faker::Name.name
)

vendor_3 = Vendor.create(
  name: Faker::Name.name
)

# Seed service requests and bills
vendors = Vendor.all

def foo
  attrs = OpenStruct.new
  is_completed = rand >= 0.5
  is_paid = rand >= 0.5
  base_day = rand(20)
  attrs.req_require_at = base_day.days.ago
  attrs.req_completed_at = attrs.req_require_at - (base_day / 2).days
  attrs.req_status = is_completed ? :in_progress : :completed
  attrs.bill_amount = rand(400)
  attrs.bill_status = if is_completed
                        is_paid ? :paid : :open
                      else
                        nil
                      end

  attrs.bill_paid_at = attrs.bill_status == :paid ? attrs.req_completed_at + 15.days : nil
  attrs.bill_due_at = is_completed ? attrs.req_completed_at + 7.days : nil

  attrs.bill_tasks = []

  rand(5).times do |_|
    attrs.bill_tasks << {
      title: Faker::Construction.trade,
      desc: Faker::Lorem.question
    }
  end
  attrs.bill_materials = []
  rand(5).times do |_|
    attrs.bill_materials << {
      title: Faker::Construction.trade,
      desc: Faker::Lorem.question
    }
  end
  attrs
end

service_types = ServiceType.all

rand(20).times do
  attr = foo
  ServiceRequest.create(
    premise: rand >= 0.5 ? premise_1 : premise_2,
    user: user_1,
    require_at: attr.req_require_at,
    completed_at: attr.req_completed_at,
    status: attr.req_status,
    vendor: vendors.sample(1).first,
    service_type: service_types.sample(1).first,
    bill: Bill.new(
      amount: attr.bill_amount,
      status: attr.bill_status,
      paid_at: attr.bill_paid_at,
      due_at: attr.bill_due_at,
      tasks: attr.bill_tasks,
      materials: attr.bill_materials
    )
  )
end

rand(20).times do
  attr = foo
  ServiceRequest.create(
    premise: premise_3,
    user: user_2,
    require_at: attr.req_require_at,
    completed_at: attr.req_completed_at,
    status: attr.req_status,
    vendor: vendors.sample(1).first,
    service_type: service_types.sample(1).first,
    bill: Bill.new(
      amount: attr.bill_amount,
      status: attr.bill_status,
      paid_at: attr.bill_paid_at,
      due_at: attr.bill_due_at,
      tasks: attr.bill_tasks,
      materials: attr.bill_materials
    )
  )
end

rand(20).times do
  attr = foo
  ServiceRequest.create(
    premise: premise_4,
    user: user_3,
    require_at: attr.req_require_at,
    completed_at: attr.req_completed_at,
    status: attr.req_status,
    vendor: vendors.sample(1).first,
    service_type: service_types.sample(1).first,
    bill: Bill.new(
      amount: attr.bill_amount,
      status: attr.bill_status,
      paid_at: attr.bill_paid_at,
      due_at: attr.bill_due_at,
    )
  )
end
