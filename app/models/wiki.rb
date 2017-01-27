class Wiki < ActiveRecord::Base

  has_many :users


  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true

  def private?
    self.private == true
  end

  def public?
    self.private == false
  end

  

end
