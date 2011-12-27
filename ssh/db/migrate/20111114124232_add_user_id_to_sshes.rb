class AddUserIdToSshes < ActiveRecord::Migration
  def self.up
    add_column :sshes, :user_id, :string
  end

  def self.down
    remove_column :sshes, :user_id
  end
end
