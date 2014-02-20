class WikisController < ApplicationController
  def index
    @wiki = Wiki.find(params[:user_id])
  end
end
