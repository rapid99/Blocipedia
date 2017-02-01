class AddCollaborationsToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :collaborations, :string
  end
end
