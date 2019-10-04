class HomeController < ApplicationController

  before_action :set_video, only: [:video_view]

  def index
    @videos = Video.where(status: :active)
  end

  def video_view
  end

  def increment_views
    video = Video.find(params[:video])
    video.count_view += 1
    if video.save
      render json: { ok: true, count: video.count_view }
    else
      render json: { ok: false }
    end
  end


  private

  def set_video
    @video = Video.find(params[:id])
  end
end
