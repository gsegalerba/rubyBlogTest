class AddUserToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :user_id, :integer, index: true
  end
end
