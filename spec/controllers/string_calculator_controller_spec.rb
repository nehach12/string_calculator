require 'rails_helper'

RSpec.describe StringCalculatorController, type: :controller do
  describe "GET #index" do
    it "assigns @result with the sum of numbers" do
      get :index, params: { numbers: "1,2,3" }
      expect(assigns(:result)).to eq(6)
    end

    it "assigns @error with the error message if an exception is raised" do
      allow(StringCalculatorService).to receive(:add).and_raise(RuntimeError, "Invalid input")
      get :index, params: { numbers: "1,2,3" }
      expect(assigns(:error)).to eq("Invalid input")
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end