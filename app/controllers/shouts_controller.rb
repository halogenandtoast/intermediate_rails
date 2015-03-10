class ShoutsController < ApplicationController
  def create
    verify_content
    current_user.shouts.create(shout_params)
    redirect_to dashboard_path
  end

  private

  def verify_content
    if invalid_content?
      raise
    end
  end

  def invalid_content?
    Shout::CONTENT_TYPES.exclude? content_class
  end

  def shout_params
    { content: build_content }
  end

  def build_content
    content_class.new(content_params)
  end

  def content_class
    params[:shout][:content_type].constantize
  end

  def content_params
    params[:shout][:content].permit!
  end
end
