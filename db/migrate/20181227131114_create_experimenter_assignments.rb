class CreateExperimenterAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :experimenter_assignments do |t|
      t.integer :user_id
      t.integer :experiment_id
      t.string  :rights
      t.integer :assigned_by_user

      t.timestamps
    end
  end
end
