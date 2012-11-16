class Question < ActiveRecord::Base
  attr_accessible :body
  belongs_to      :poll
  has_many        :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers

end
