FactoryBot.define do
  factory :enemy do
    name { FFaker::Lorem.word }
    power_base { FFaker::Random.rand(1..99) }
    power_step { FFaker::Random.rand(1..9) }
    level { FFaker::Random.rand(1..90) }
    kind { %w[goblin orc demon dragon].sample }
  end
end
