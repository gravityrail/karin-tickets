class AddShowToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :show_id, :integer
  end

  def self.down
    remove_column :events, :show_id
  end
end
