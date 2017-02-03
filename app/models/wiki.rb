include ApplicationHelper

class Wiki < ActiveRecord::Base

  has_many :users, through: :collaborations
  has_many :collaborations


  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true

  def private?
   self.private == true
  end

  def user
    User.find(self.user_id)
  end


  def find_users
    User.all.map do |x|
      x.email
    end
  end

  # def add_collaborator(collaborator)
  #   @wiki.collaboration << collaborator
  # end

  def markdown_title
    markdown_to_html (self.title)
  end

  def markdown_body
    markdown_to_html (self.body)
  end

  private

  def make_public
    self.private = false
  end



end
