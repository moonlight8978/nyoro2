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

ActiveRecord::Schema.define(version: 20171125071228) do

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "name_en"
    t.string "name_pronounce"
    t.string "code"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_countries_on_code"
    t.index ["name_pronounce"], name: "index_countries_on_name_pronounce"
  end

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
    t.bigint "editor_id"
    t.bigint "release_id"
    t.index ["album_id"], name: "index_db_album_versions_on_album_id"
    t.index ["editor_id"], name: "index_db_album_versions_on_editor_id"
    t.index ["marked"], name: "index_db_album_versions_on_marked"
    t.index ["previous_version_id"], name: "index_db_album_versions_on_previous_version_id"
    t.index ["release_id"], name: "index_db_album_versions_on_release_id"
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
    t.integer "comments_count", default: 0
    t.index ["created_at"], name: "index_db_albums_on_created_at"
    t.index ["latest_version_id"], name: "index_db_albums_on_latest_version_id"
    t.index ["marked"], name: "index_db_albums_on_marked"
    t.index ["updated_at"], name: "index_db_albums_on_updated_at"
  end

  create_table "db_albums_companies", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "album_id", null: false
    t.bigint "company_id", null: false
    t.index ["album_id", "company_id"], name: "index_db_albums_companies_on_album_id_and_company_id"
  end

  create_table "db_albums_tags", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "album_id", null: false
    t.bigint "tag_id", null: false
    t.index ["album_id", "tag_id"], name: "index_db_albums_tags_on_album_id_and_tag_id"
  end

  create_table "db_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "latest_version_id"
    t.boolean "marked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count", default: 0
    t.index ["latest_version_id"], name: "index_db_companies_on_latest_version_id"
    t.index ["marked"], name: "index_db_companies_on_marked"
  end

  create_table "db_company_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "company_id"
    t.bigint "previous_version_id"
    t.bigint "country_id"
    t.boolean "marked", default: false
    t.string "name"
    t.string "name_en"
    t.string "name_pronounce"
    t.date "established_at"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "editor_id"
    t.index ["company_id"], name: "index_db_company_versions_on_company_id"
    t.index ["country_id"], name: "index_db_company_versions_on_country_id"
    t.index ["editor_id"], name: "index_db_company_versions_on_editor_id"
    t.index ["established_at"], name: "index_db_company_versions_on_established_at"
    t.index ["marked"], name: "index_db_company_versions_on_marked"
    t.index ["name_pronounce"], name: "index_db_company_versions_on_name_pronounce"
    t.index ["previous_version_id"], name: "index_db_company_versions_on_previous_version_id"
  end

  create_table "db_discs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.boolean "marked", default: false
    t.integer "number"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "editor_id"
    t.index ["editor_id"], name: "index_db_discs_on_editor_id"
    t.index ["marked"], name: "index_db_discs_on_marked"
    t.index ["number"], name: "index_db_discs_on_number"
  end

  create_table "db_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "latest_version_id"
    t.boolean "marked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count", default: 0
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
    t.boolean "gender"
    t.string "blood_type"
    t.string "website"
    t.string "twitter"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.bigint "editor_id"
    t.index ["country_id"], name: "index_db_person_versions_on_country_id"
    t.index ["editor_id"], name: "index_db_person_versions_on_editor_id"
    t.index ["marked"], name: "index_db_person_versions_on_marked"
    t.index ["name_pronounce"], name: "index_db_person_versions_on_name_pronounce"
    t.index ["person_id"], name: "index_db_person_versions_on_person_id"
    t.index ["previous_version_id"], name: "index_db_person_versions_on_previous_version_id"
  end

  create_table "db_releases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "price", limit: 24
    t.string "currency"
    t.string "format"
    t.date "released_at"
    t.string "catalog_number"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "publisher_id"
    t.bigint "editor_id"
    t.boolean "marked", default: false
    t.index ["catalog_number"], name: "index_db_releases_on_catalog_number"
    t.index ["editor_id"], name: "index_db_releases_on_editor_id"
    t.index ["publisher_id"], name: "index_db_releases_on_publisher_id"
    t.index ["released_at"], name: "index_db_releases_on_released_at"
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
    t.bigint "editor_id"
    t.index ["editor_id"], name: "index_db_song_versions_on_editor_id"
    t.index ["marked"], name: "index_db_song_versions_on_marked"
    t.index ["number"], name: "index_db_song_versions_on_number"
    t.index ["previous_version_id"], name: "index_db_song_versions_on_previous_version_id"
    t.index ["song_id"], name: "index_db_song_versions_on_song_id"
    t.index ["title_pronounce"], name: "index_db_song_versions_on_title_pronounce"
  end

  create_table "db_song_versions_staffs", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "song_version_id", null: false
    t.bigint "staff_id", null: false
    t.index ["song_version_id", "staff_id"], name: "index_db_song_versions_staffs_on_song_version_id_and_staff_id"
  end

  create_table "db_songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "disc_id"
    t.bigint "latest_version_id"
    t.boolean "marked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count", default: 0
    t.index ["disc_id"], name: "index_db_songs_on_disc_id"
    t.index ["latest_version_id"], name: "index_db_songs_on_latest_version_id"
    t.index ["marked"], name: "index_db_songs_on_marked"
  end

  create_table "db_staff_versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "staff_id"
    t.bigint "previous_version_id"
    t.boolean "marked", default: false
    t.bigint "person_id"
    t.string "position"
    t.string "alias"
    t.string "alias_en"
    t.string "alias_pronounce"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "editor_id"
    t.index ["alias_pronounce"], name: "index_db_staff_versions_on_alias_pronounce"
    t.index ["editor_id"], name: "index_db_staff_versions_on_editor_id"
    t.index ["marked"], name: "index_db_staff_versions_on_marked"
    t.index ["person_id"], name: "index_db_staff_versions_on_person_id"
    t.index ["previous_version_id"], name: "index_db_staff_versions_on_previous_version_id"
    t.index ["staff_id"], name: "index_db_staff_versions_on_staff_id"
  end

  create_table "db_staffs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "latest_version_id"
    t.boolean "marked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latest_version_id"], name: "index_db_staffs_on_latest_version_id"
    t.index ["marked"], name: "index_db_staffs_on_marked"
  end

  create_table "db_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "name_en"
    t.string "name_pronounce"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count", default: 0
    t.bigint "editor_id"
    t.boolean "marked", default: false
    t.index ["editor_id"], name: "index_db_tags_on_editor_id"
    t.index ["name_pronounce"], name: "index_db_tags_on_name_pronounce"
  end

  create_table "ec_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "parent_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_ec_categories_on_parent_id"
  end

  create_table "ec_invoice_original_invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id"
    t.integer "total"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone_number"
    t.index ["order_id"], name: "index_ec_invoice_original_invoices_on_order_id"
  end

  create_table "ec_invoice_original_invoices_order_products", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "original_invoice_id", null: false
    t.bigint "product_id", null: false
    t.index ["original_invoice_id", "product_id"], name: "index_ec_original_invoice_id_product_id"
  end

  create_table "ec_invoice_shop_invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_id"
    t.bigint "order_id"
    t.integer "total"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "original_invoice_id"
    t.index ["order_id"], name: "index_ec_invoice_shop_invoices_on_order_id"
    t.index ["original_invoice_id"], name: "index_ec_invoice_shop_invoices_on_original_invoice_id"
    t.index ["shop_id"], name: "index_ec_invoice_shop_invoices_on_shop_id"
  end

  create_table "ec_invoice_shop_invoices_order_products", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shop_invoice_id", null: false
    t.bigint "product_id", null: false
    t.index ["shop_invoice_id", "product_id"], name: "index_ec_shop_invoice_id_product_id"
  end

  create_table "ec_order_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.integer "price"
    t.string "color"
    t.float "shop_discount", limit: 24
    t.float "system_discount", limit: 24
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ec_order_products_on_product_id"
  end

  create_table "ec_order_shippings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "method"
    t.integer "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ec_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "shipping_id"
    t.bigint "payment_id"
    t.bigint "user_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_method"
    t.index ["payment_id"], name: "index_ec_orders_on_payment_id"
    t.index ["shipping_id"], name: "index_ec_orders_on_shipping_id"
    t.index ["user_id"], name: "index_ec_orders_on_user_id"
  end

  create_table "ec_payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type"
    t.bigint "user_id"
    t.string "card_number"
    t.date "expiration_date"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_number"], name: "index_ec_payments_on_card_number"
    t.index ["type"], name: "index_ec_payments_on_type"
    t.index ["user_id"], name: "index_ec_payments_on_user_id"
  end

  create_table "ec_product_colors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ec_product_colors_on_product_id"
  end

  create_table "ec_product_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.float "shop", limit: 24, default: 0.0
    t.float "system", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ec_product_discounts_on_product_id"
  end

  create_table "ec_product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "product_id"
    t.string "image"
    t.boolean "nsfw", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ec_product_images_on_product_id"
  end

  create_table "ec_product_storages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "color_id"
    t.integer "total"
    t.integer "sold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_ec_product_storages_on_color_id"
  end

  create_table "ec_products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "category_id"
    t.bigint "shop_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comments_count", default: 0
    t.index ["category_id"], name: "index_ec_products_on_category_id"
    t.index ["shop_id"], name: "index_ec_products_on_shop_id"
  end

  create_table "ec_shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "type"
    t.string "name"
    t.string "website"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ec_shops_on_type"
    t.index ["user_id"], name: "index_ec_shops_on_user_id"
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

  create_table "feature_ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "rateable_type"
    t.bigint "rateable_id"
    t.integer "star"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rateable_type", "rateable_id"], name: "index_feature_ratings_on_rateable_type_and_rateable_id"
    t.index ["user_id"], name: "index_feature_ratings_on_user_id"
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
    t.bigint "country_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["country_id"], name: "index_users_on_country_id"
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
