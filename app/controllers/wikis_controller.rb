class WikisController < ApplicationController

  def index
	@user = User.find(params[:user_id])
    @wikis = @user.wikis
  end
  
  def show
	@wiki = Wiki.find(params[:id])
	if request.path != wiki_path(@wiki)
    redirect_to @wiki, status: :moved_permanently
  end
  end
  
  def new
	@user = User.find(params[:user_id])
	@wiki = Wiki.new
  end
  
  def create
	user = User.find(params[:user_id])
	wiki = Wiki.new(params[:wiki])
	
	wiki.user = user
			
	if wiki.save
	  flash[:notice] = "Wiki saved successfully"
	  redirect_to user_wikis_path(current_user)
	else
	  flash[:error] = "Wiki not saved successfully. Please try again."
	end
  end
  
  def edit
	@wiki = Wiki.find(params[:id])
  end
  
  def update
  	wiki = Wiki.find(params[:id])
  	
  	if wiki.update_attributes(params[:wiki])
  	  flash[:notice] = "Changes saved successfully"
  	  redirect_to wiki
  	else
  	  flash[:error] = "Changes not saved successfully. Please try again."
  	  render :edit
  	end
  end

  def preview
    @preview_text = params[:preview_text]

    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    #@preview_text = "test"
    render text: (redcarpet.render @preview_text).html_safe
  end

  
end
