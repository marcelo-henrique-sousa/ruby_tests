require 'rails_helper'

RSpec.describe "Wepons", type: :request do
  describe "GET /wepons" do
    it "check if weapon attrs is present" do
      weapons = create_list(:wepon, 2)
      get wepons_path
      weapons.each do |weapon|
        expect(response.body).to include( weapon.current_power.to_s,
          wepon_path(weapon.id) )
      end
    end
    # it "check if current power is present"
    # it "check if title is present"
    # it "check if link to weapon details page is present"
  end

  describe "POST /wepons" do
    it "create weapon according correct params"
    it "do not create wepon if params is invalid"
  end

  describe "GET /wepon" do
    it "check if all weapon attrs is present" do
      wepon =  create(:wepon)
      get wepon_path(wepon.id)
      expect(response.body).to include(wepon.level.to_s)
    end
  end

  describe "DELETE /wepon" do
    it "check if weapon has successfully deleted"
  end

end