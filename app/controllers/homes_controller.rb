class HomesController < ApplicationController
  def show
  end

  def difficult_level_update
    session[:difficult_level_key] = params[:key]
    redirect_to :root
  end
end
