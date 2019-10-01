require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    # request.env["HTTP_ACCEPT"] = 'application/json'

    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user
  end

  describe "GET #index" do

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #show" do

    context "video exists" do
        it "Returns success" do
          video = create(:video, user: @current_user)
          get :show, params: {id: video.id}
          expect(response).to have_http_status(:success)
        end
    end

    context "video don't exists" do
      it "Redirects to root" do
        get :show, params: {id: 0}
        expect(response).to redirect_to('/')
      end
    end
  end


  describe "POST #create" do
    before(:each) do
      @video_attributes = attributes_for(:video, user: @current_user)
      post :create, params: {video: @video_attributes}
    end

    it "Redirect to new video" do
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/videos/#{Video.last.id}")
    end

    it "Create video with right attributes" do
      expect(Video.last.user).to eql(@current_user)
      expect(Video.last.name).to eql(@video_attributes[:name])
      expect(Video.last.description).to eql(@video_attributes[:description])
      expect(Video.last.url).to eql(@video_attributes[:url])
      expect(Video.last.status).to eql('active')
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "User is the video Owner" do
      it "returns http success" do
        video = create(:video, user: @current_user)
        delete :destroy, params: {id: video.id}
        expect(response).to have_http_status(:success)
      end
    end

    context "User isn't the Video Owner" do
      it "returns http forbidden" do
        video = create(:video)
        delete :destroy, params: {id: video.id}
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "PUT #update" do
    before(:each) do
      @new_video_attributes = attributes_for(:video)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "User is the Video Owner" do
      before(:each) do
        video = create(:video, user: @current_user)
        put :update, params: {id: video.id, video: @new_video_attributes}
      end

      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "Video have the new attributes" do
        expect(Video.last.name).to eq(@new_video_attributes[:name])
        expect(Video.last.description).to eq(@new_video_attributes[:description])
        expect(Video.last.url).to eq(@new_video_attributes[:url])
      end
    end

    context "User isn't the Video Owner" do
      it "returns http forbidden" do
        video = create(:video)
        put :update, params: {id: video.id, video: @new_video_attributes}
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

end