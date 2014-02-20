class Collaborator < ActiveRecord::Base
  attr_accessible :user_id, :wiki_id
  
  belongs_to :wiki
  belongs_to :user #this collaboration belongs to a user
end
