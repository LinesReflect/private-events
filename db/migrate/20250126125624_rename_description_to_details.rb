class RenameDescriptionToDetails < ActiveRecord::Migration[8.0]
  def change
    rename_column :events, :description, :details
  end
end
