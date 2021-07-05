require 'rails_helper'

RSpec.describe Wepon, type: :model do
  it " Return current power of wepon based in factory " do
    wepon = build(:wepon, power_step: FFaker::Random.rand(10..90) )

    expect( wepon ).to_not be_valid
  end

  it " Show wepon title according this syntax " do
    name = FFaker::Lorem.words
    description = FFaker::Lorem.phrase
    power_base = FFaker::Random.rand(1..99)
    power_step = FFaker::Random.rand(1..10)
    level = FFaker::Random.rand(1..90)

    wepon = create( :wepon, name: name, description: description, power_base: power_base, power_step: power_step, level: level )
    expect(wepon.title).to eq("#{name} ##{level}")
  end
end
