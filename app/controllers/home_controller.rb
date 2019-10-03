class HomeController < ApplicationController

  before_action :set_video, only: [:video_view]

  def index
    @videos = Video.where(status: :active)
  end

  def video_view

  end


  private

  def set_video
    @video = Video.find(params[:id])
  end
end
