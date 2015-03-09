class ShoutsController < ApplicationController
  def create
    current_user.shouts.create(shout_params)
    redirect_to dashboard_path
  end

  private

  def shout_params
    { content: build_content }
  end

  def build_content
    params[:shout][:content_type].constantize.new(content_params)
  end

  def content_params
    params[:shout][:content].permit!
  end
end
