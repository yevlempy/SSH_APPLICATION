class CreateSshes < ActiveRecord::Migration
  def self.up
    create_table :sshes do |t|
      t.string :name
      t.string :phone_number
      t.string :Email_id
      t.string :ssh_key

      t.timestamps
    end
  end

  def self.down
    drop_table :sshes
  end
end
