class UsersController < ApplicationController
  def wiki_table_data
  
	#table_data = {"aaData"}
	
	user = User.find(params[:id])
	wikis = user.wikis
	
	wikis.map do |wiki|
		[
			wiki.user.id,
			wiki.friendly_id,
			wiki.title
		]
	end
	
	render json: wikis
  end
end
