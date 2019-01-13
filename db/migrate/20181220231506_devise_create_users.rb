# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_email, null: false, default: ""
      t.string :encrypted_email_iv, null: false, default: ""
      t.string :encrypted_email_bidx, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## System
      t.boolean :terms
      t.string  :code
      t.integer :role

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false
      t.string   :unlock_token
      t.datetime :locked_at

      # user specific fields
      t.string   :encrypted_firstname, null: false
      t.string   :encrypted_firstname_iv, null: false
      t.string   :encrypted_lastname, null: false
      t.string   :encrypted_lastname_iv, null: false
      t.date     :encrypted_birthday
      t.date     :encrypted_birthday_iv
      t.string   :encrypted_matrikel, null: false
      t.string   :encrypted_matrikel_iv, null: false
      t.string   :gender
      t.integer  :study_id
      t.integer  :degree_id
      t.string   :country_name
      t.string   :begin_study
      t.boolean  :experience
      t.integer  :noshow_count, :default => 0
      t.integer  :participations_count, :default => 0

      t.string   :secondary_email
      t.string   :secondary_email_confirmation_token
      t.datetime :secondary_email_confirmed_at
      t.datetime :secondary_email_confirmation_sent_at

      t.integer  :langDE
      t.integer  :langEN

      t.timestamps null: false
    end

    add_index :users, :encrypted_email_iv, unique: true
    add_index :users, :encrypted_email_bidx, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
  end
end
