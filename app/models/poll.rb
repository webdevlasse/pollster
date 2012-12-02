class Poll < ActiveRecord::Base  
  validates :name, :presence => true
  before_create :slug_save

  attr_accessible :name, :slug, :name

  has_many :questions, :dependent => :destroy

  def slug_save
    string = ""
    6.times do
      string << rand(1..9).to_s
    end
    self.slug = string
  end
end
