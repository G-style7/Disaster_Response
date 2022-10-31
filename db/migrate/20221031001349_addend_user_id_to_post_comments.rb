class AddendUserIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :end_user_id, :integer
  end
end
