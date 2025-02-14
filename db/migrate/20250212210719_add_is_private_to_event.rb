class AddIsPrivateToEvent < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :is_private, :boolean, default: true
  end
end
