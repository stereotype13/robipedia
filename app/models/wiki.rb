class Wiki < ActiveRecord::Base
  attr_accessible :body, :title
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]
  
  belongs_to :user
  
  has_many :collaborators
  
  
end
