class CreateExperiments < ActiveRecord::Migration[5.2]
  def change
    create_table :experiments do |t|
      t.references :user, foreign_key: true

      t.string   :key
      t.integer  :form

      t.string   :title
      t.text     :description
      t.text     :contact_name
      t.string   :contact_email
      t.boolean  :finished, default: false
      t.boolean  :signup_active, default: false
      t.text     :experimenters

      t.string   :invitation_subject, :default => "Invitation to an Experiment"
      t.text     :invitation_text
      t.datetime :invitation_start
      t.integer  :invitation_hours

      t.integer  :assignments_size, default: 0

      t.integer  :configuration_size, default: -1
      t.string   :configuration_gender
      t.integer  :configuration_study_id
      t.integer  :configuration_degree_id
      t.boolean  :configuration_experience
      t.integer  :configuration_lang

      t.float    :vp_primary
      t.float    :vp_secondary
      t.float    :vp_max
      t.float    :vp_available

      t.string   :confirmation_subject, :default => "Confirmation of Registration"
      t.text     :confirmation_text

      t.timestamps
    end

    add_index :experiments, [:user_id, :created_at]
  end
end
