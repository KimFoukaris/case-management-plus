class Comment < ActiveRecord::Base
        
    validates :description, presence: true
      
  end