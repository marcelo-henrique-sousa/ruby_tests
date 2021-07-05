require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "PUT /enemies" do
    context "when enemy exists" do
      let(:enemy) { create(:enemy) }
      let(:enemy_attrs) { attributes_for(:enemy) }
      before do
        put "/enemies/#{enemy.id}", params: enemy_attrs
      end

      it "return success status code" do   
        expect(response).to  have_http_status(:success)
      end
      it "updates record" do
        expect(enemy.reload).to have_attributes(enemy_attrs) 
      end
      it "return enemy updated" do
        expect(enemy.reload).to have_attributes(json.except('created_at','updated_at')) 
      end
    end
    
    context "when enemy does not exists" do

      before do
        put '/enemies/0', params: attributes_for(:enemy)
      end

      it "returns status code 404" do
        expect(response).to  have_http_status(:not_found)
      end
      it "returns not found message" do
        expect(response.body).to  match(/Couldn't find Enemy/)
      end
    end
    
  end

  describe 'DELETE /enemies' do

    context 'when enemy exists' do
      let(:enemy) { create(:enemy) }
      before do
        delete "/enemies/#{enemy.id}"
      end
      it "returns status code no content" do
        expect(response).to  have_http_status(:success)
      end
      it "destroy record" do
        expect{ enemy.reload }.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context 'when enemy does not exists' do
      before do
        delete '/enemies/0'
      end
      it 'returns not found status code' do
        expect(response).to  have_http_status(:not_found)
      end
      it 'returns not found message' do
        expect(response.body).to  match(/Couldn't find Enemy/)
      end
    end
  end
end
