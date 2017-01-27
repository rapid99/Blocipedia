class Wiki < ActiveRecord::Base

  belongs_to :user


  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true

  def private?
    self.private == true
  end

  def public?
    self.private == false
  end



end
