# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_07_171703) do

  create_table "experimenter_assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "experiment_id"
    t.string "rights"
    t.integer "assigned_by_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experiments", force: :cascade do |t|
    t.integer "user_id"
    t.string "key"
    t.integer "form"
    t.string "title"
    t.text "description"
    t.text "contact_name"
    t.string "contact_email"
    t.boolean "finished", default: false
    t.boolean "signup_active", default: false
    t.text "experimenters"
    t.string "invitation_subject", default: "Invitation to an Experiment"
    t.text "invitation_text"
    t.datetime "invitation_start"
    t.integer "invitation_hours"
    t.integer "assignments_size", default: 0
    t.integer "configuration_size", default: -1
    t.string "configuration_gender"
    t.integer "configuration_study_id"
    t.integer "configuration_degree_id"
    t.boolean "configuration_experience"
    t.integer "configuration_lang"
    t.float "vp_primary"
    t.float "vp_secondary"
    t.float "vp_max"
    t.float "vp_available"
    t.string "confirmation_subject", default: "Confirmation of Registration"
    t.text "confirmation_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_experiments_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_experiments_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "experiment_id"
    t.integer "user_id"
    t.integer "filter_id"
    t.datetime "invited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_participations_on_experiment_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "session_participations", force: :cascade do |t|
    t.integer "session_id"
    t.integer "user_id"
    t.datetime "reminded_at"
    t.boolean "showup", default: false, null: false
    t.boolean "participated", default: false, null: false
    t.boolean "noshow", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_session_participations_on_session_id"
    t.index ["user_id"], name: "index_session_participations_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "experiment_id"
    t.text "location"
    t.integer "reference_session_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text "description"
    t.integer "needed", default: 20
    t.integer "reserve", default: 2
    t.text "limitations"
    t.boolean "reminder_enabled", default: false
    t.string "reminder_subject"
    t.text "reminder_text"
    t.integer "reminder_hours", default: 48
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_id"], name: "index_sessions_on_experiment_id"
    t.index ["reference_session_id"], name: "index_sessions_on_reference_session_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_email", default: "", null: false
    t.string "encrypted_email_iv", default: "", null: false
    t.string "encrypted_email_bidx", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "terms"
    t.string "code"
    t.integer "role"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "encrypted_firstname", null: false
    t.string "encrypted_firstname_iv", null: false
    t.string "encrypted_lastname", null: false
    t.string "encrypted_lastname_iv", null: false
    t.date "encrypted_birthday"
    t.date "encrypted_birthday_iv"
    t.string "encrypted_matrikel", null: false
    t.string "encrypted_matrikel_iv", null: false
    t.string "gender"
    t.integer "study_id"
    t.integer "degree_id"
    t.string "country_name"
    t.string "begin_study"
    t.boolean "experience"
    t.integer "noshow_count", default: 0
    t.integer "participations_count", default: 0
    t.string "secondary_email"
    t.string "secondary_email_confirmation_token"
    t.datetime "secondary_email_confirmed_at"
    t.datetime "secondary_email_confirmation_sent_at"
    t.integer "langDE"
    t.integer "langEN"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["encrypted_email_bidx"], name: "index_users_on_encrypted_email_bidx", unique: true
    t.index ["encrypted_email_iv"], name: "index_users_on_encrypted_email_iv", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
