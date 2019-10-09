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

ActiveRecord::Schema.define(version: 2019_10_08_082914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.string "cv", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.date "date_de_naissance"
    t.string "auto_entrepreneur"
    t.text "experience"
    t.string "statut"
    t.string "connaissance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_agents_on_user_id"
  end

  create_table "annonces", force: :cascade do |t|
    t.string "titre_annonce"
    t.string "type_de_bien"
    t.string "meublé"
    t.integer "surface"
    t.string "pièces"
    t.string "classe_énergie"
    t.string "ges"
    t.text "description"
    t.integer "loyer_mensuel"
    t.string "adresse"
    t.string "ville"
    t.string "email"
    t.string "téléphone"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "statut"
    t.string "photo", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.string "photo1", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.float "latitude"
    t.float "longitude"
    t.string "agent_user_id"
    t.string "checkout_agent"
    t.string "checkout_proprio"
    t.string "photo2", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.string "photo3", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.string "photo4", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.integer "price_cents", default: 0, null: false
    t.index ["user_id"], name: "index_annonces_on_user_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.string "jours"
    t.text "heures", default: [], array: true
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "candidatures", force: :cascade do |t|
    t.integer "durée"
    t.string "dispo_jours"
    t.string "dispo_heures"
    t.string "statut"
    t.bigint "annonce_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "commentaire"
    t.index ["annonce_id"], name: "index_candidatures_on_annonce_id"
    t.index ["user_id"], name: "index_candidatures_on_user_id"
  end

  create_table "friendships", id: :serial, force: :cascade do |t|
    t.string "friendable_type"
    t.integer "friendable_id"
    t.integer "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "blocker_id"
    t.integer "status"
    t.index ["friendable_id", "friend_id"], name: "index_friendships_on_friendable_id_and_friend_id", unique: true
  end

  create_table "meetings", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "annonce_id"
    t.index ["annonce_id"], name: "index_meetings_on_annonce_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "annonce_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "user_id"
    t.bigint "annonce_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annonce_id"], name: "index_orders_on_annonce_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo1", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.string "photo2", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.string "photo3", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.string "photo4", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.string "photo5", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.bigint "annonce_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annonce_id"], name: "index_photos_on_annonce_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "photo"
    t.bigint "annonce_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annonce_id"], name: "index_pictures_on_annonce_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "civilité"
    t.string "nom"
    t.string "prénom"
    t.string "pseudo"
    t.string "adresse"
    t.string "ville"
    t.string "dispo_jours"
    t.string "dispo_heures"
    t.string "téléphone"
    t.string "photo", default: "image/upload/v1565065662/profile_default_kttdt0.jpg"
    t.float "latitude"
    t.float "longitude"
    t.string "statut"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "annonces", "users"
  add_foreign_key "availabilities", "users"
  add_foreign_key "candidatures", "annonces"
  add_foreign_key "candidatures", "users"
  add_foreign_key "orders", "annonces"
  add_foreign_key "orders", "users"
  add_foreign_key "photos", "annonces"
  add_foreign_key "pictures", "annonces"
end
