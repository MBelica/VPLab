class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.integer :experiment_id
      t.integer :user_id
      t.integer :filter_id
      t.datetime :invited_at, :null => true, :default => nil

      t.timestamps
    end

    add_index :participations, :experiment_id
    add_index :participations, :user_id
  end
end
