class CreateCommands < ActiveRecord::Migration
  def self.up
    create_table :commands do |t|
      t.string :execute

      t.datetime :created_at
    end
  end

  def self.down
    drop_table :commands
  end
end
