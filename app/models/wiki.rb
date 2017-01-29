include ApplicationHelper

class Wiki < ActiveRecord::Base

  belongs_to :user


  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true

  def private?
   self.private == true
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
