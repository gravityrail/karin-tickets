class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.string :name
      t.string :byline
      t.string :tagline
      t.text :description
      t.text :credits
      t.text :quotes

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
