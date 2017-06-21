class AddAdminToUserCommunities < ActiveRecord::Migration[5.1]
  def change
    add_column :user_communities, :admin, :boolean, :default => false
  end
end
