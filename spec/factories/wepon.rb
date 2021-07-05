FactoryBot.define do
  factory :wepon do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.phrase }
    power_base { FFaker::Random.rand(1..99) }
    power_step { FFaker::Random.rand(1..9) }
    level { FFaker::Random.rand(1..90) }
  end
end
