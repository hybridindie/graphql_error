# frozen_string_literal: true

50.times do
  Account.create(name: Faker::Company.name)
end
