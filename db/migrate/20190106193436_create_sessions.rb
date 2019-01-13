class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer  :experiment_id
      t.text     :location
      t.integer  :reference_session_id

      t.datetime :start_at
      t.datetime :end_at

      t.text     :description
      t.integer  :needed, :default => 20
      t.integer  :reserve, :default => 2

      t.text     :limitations

      t.boolean  :reminder_enabled, :default => false
      t.string   :reminder_subject
      t.text     :reminder_text
      t.integer  :reminder_hours, :default => 48

      t.timestamps
    end

    add_index :sessions, :experiment_id
    add_index :sessions, :reference_session_id
  end
end
