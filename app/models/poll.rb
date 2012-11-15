class Poll < ActiveRecord::Base
  before_create :slug_save

  attr_accessible :name, :slug

  has_many :questions

  def slug_save
    string = ""
    6.times do
      string << rand(1..9).to_s
    end
    self.slug = string
  end
end
