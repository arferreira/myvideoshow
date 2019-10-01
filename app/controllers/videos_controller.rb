class VideosController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :set_video, only: [:show, :destroy, :update]
  before_action :is_owner?, only: [:destroy, :update]

  def index
    @videos = current_user.videos
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to "/videos/#{@video.id}" }
      else
        format.html { redirect_to main_app.root_url, notice: @video.errors }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.json { render json: true }
      else
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video.destroy
    respond_to do |format|
      format.json { render json: true }
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:name, :description, :url, :status).merge(user: current_user)
  end

  def is_owner?
    unless current_user == @video.user
      respond_to do |format|
        format.json { render json: false, status: :forbidden }
        format.html { redirect_to main_app.root_url }
      end
    end
  end
end
