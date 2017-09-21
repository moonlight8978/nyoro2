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

ActiveRecord::Schema.define(version: 20170921122853) do

  create_table "db_album_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "previous_version_id"
    t.bigint "album_id"
    t.boolean "marked", default: false
    t.string "title"
    t.string "title_en"
    t.string "title_pronounce"
    t.string "image"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_db_album_versions_on_album_id"
    t.index ["marked"], name: "index_db_album_versions_on_marked"
    t.index ["previous_version_id"], name: "index_db_album_versions_on_previous_version_id"
    t.index ["title_pronounce"], name: "index_db_album_versions_on_title_pronounce"
  end

  create_table "db_album_versions_discs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "album_version_id", null: false
    t.bigint "disc_id", null: false
    t.index ["album_version_id", "disc_id"], name: "index_db_album_versions_discs_on_album_version_id_and_disc_id"
  end

  create_table "db_albums", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "latest_version_id"
    t.boolean "marked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_db_albums_on_created_at"
    t.index ["latest_version_id"], name: "index_db_albums_on_latest_version_id"
    t.index ["marked"], name: "index_db_albums_on_marked"
    t.index ["updated_at"], name: "index_db_albums_on_updated_at"
  end

  create_table "db_discs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "marked", default: false
    t.integer "number"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marked"], name: "index_db_discs_on_marked"
    t.index ["number"], name: "index_db_discs_on_number"
  end

  create_table "db_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "latest_version_id"
    t.boolean "marked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latest_version_id"], name: "index_db_people_on_latest_version_id"
    t.index ["marked"], name: "index_db_people_on_marked"
  end

  create_table "db_person_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "person_id"
    t.bigint "previous_version_id"
    t.boolean "marked", default: false
    t.string "name"
    t.string "name_en"
    t.string "name_pronounce"
    t.date "birthday"
    t.string "website"
    t.string "twitter"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gender"
    t.string "blood_type"
    t.index ["marked"], name: "index_db_person_versions_on_marked"
    t.index ["name_pronounce"], name: "index_db_person_versions_on_name_pronounce"
    t.index ["person_id"], name: "index_db_person_versions_on_person_id"
    t.index ["previous_version_id"], name: "index_db_person_versions_on_previous_version_id"
  end

  create_table "db_song_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "previous_version_id"
    t.bigint "song_id"
    t.boolean "marked", default: false
    t.string "title"
    t.string "title_en"
    t.string "title_pronounce"
    t.string "length"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marked"], name: "index_db_song_versions_on_marked"
    t.index ["number"], name: "index_db_song_versions_on_number"
    t.index ["previous_version_id"], name: "index_db_song_versions_on_previous_version_id"
    t.index ["song_id"], name: "index_db_song_versions_on_song_id"
    t.index ["title_pronounce"], name: "index_db_song_versions_on_title_pronounce"
  end

  create_table "db_songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "disc_id"
    t.bigint "latest_version_id"
    t.boolean "marked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_id"], name: "index_db_songs_on_disc_id"
    t.index ["latest_version_id"], name: "index_db_songs_on_latest_version_id"
    t.index ["marked"], name: "index_db_songs_on_marked"
  end

  create_table "feature_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_feature_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_feature_comments_on_user_id"
  end

  create_table "feature_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "loggable_type"
    t.bigint "loggable_id"
    t.string "title"
    t.string "classification"
    t.string "action"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification", "action"], name: "index_feature_logs_on_classification_and_action"
    t.index ["classification"], name: "index_feature_logs_on_classification"
    t.index ["loggable_type", "loggable_id"], name: "index_feature_logs_on_loggable_type_and_loggable_id"
    t.index ["user_id"], name: "index_feature_logs_on_user_id"
  end

  create_table "user_roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_user_roles_on_name"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "user_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name"
    t.string "last_name"
    t.string "name_pronounce"
    t.string "avatar"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  create_table "users_user_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.index ["user_id", "role_id"], name: "index_users_user_roles_on_user_id_and_role_id"
  end

end
