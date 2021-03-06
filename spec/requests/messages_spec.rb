 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/messages", type: :request do
  let(:valid_attributes) do
    {
      name: Faker::Name.name,
      ip_address: Faker::Internet.ip_v4_address,
      entry: Faker::Lorem.paragraph
    }
  end

  let(:invalid_attributes) do
    {name: '', ip_address: '', entry: ''}
  end

  describe "GET /index" do
    it "renders a successful response" do
      Message.create! valid_attributes
      get messages_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_message_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Message" do
        expect {
          post messages_url, params: { message: valid_attributes }
        }.to change(Message, :count).by(1)
      end

      it "redirects to the created message" do
        post messages_url, params: { message: valid_attributes }
        expect(response).to redirect_to(messages_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Message" do
        expect {
          post messages_url, params: { message: invalid_attributes }
        }.to change(Message, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post messages_url, params: { message: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
