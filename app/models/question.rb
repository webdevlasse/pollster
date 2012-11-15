class Question < ActiveRecord::Base
  attr_accessible :body
  belongs_to :poll
end
