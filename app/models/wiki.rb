include ApplicationHelper

class Wiki < ActiveRecord::Base

  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations


  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true

  def private?
   self.private == true
  end


  def find_users
    User.all.map do |x|
      x.email
    end
  end

  def add_collaborator(collab_id)
    Collaboration.create(user_id: collab_id, wiki_id: self.id)
  end

  def remove_collaborator(collab_id)
    Collaboration.delete(user_id: collab_id, wiki_id: self.id)
  end

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
