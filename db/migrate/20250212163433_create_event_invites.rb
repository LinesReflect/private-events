class CreateEventInvites < ActiveRecord::Migration[8.0]
  def change
    create_table :event_invites do |t|
      t.references :event, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
