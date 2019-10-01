class ApplicationController < ActionController::Base

    rescue_from ActiveRecord::RecordNotFound, :with => :render_404

    # redirect not found to root 
    def render_404
    redirect_to main_app.root_url
    end
end
