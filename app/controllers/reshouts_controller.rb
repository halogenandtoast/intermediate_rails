class ReshoutsController < ApplicationController
  def create
    current_user.reshout(find_shout)
    redirect_to :back
  end

  def destroy
    current_user.undo_reshout(find_shout)
    redirect_to :back
  end

  private

  def find_shout
    Shout.find(params[:id])
  end
end
