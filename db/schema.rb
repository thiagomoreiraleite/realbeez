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

ActiveRecord::Schema.define(version: 2020_09_22_133015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agents", force: :cascade do |t|
    t.date "date_de_naissance"
    t.string "auto_entrepreneur"
    t.text "experience"
    t.string "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "connaissance"
    t.string "justif_entrepreneur", default: "image/upload/v1582613499/default_annonce.png"
    t.index ["user_id"], name: "index_agents_on_user_id"
  end

  create_table "annonces", force: :cascade do |t|
    t.string "titre_annonce"
    t.string "type_de_bien"
    t.string "meublé"
    t.integer "surface"
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
    t.string "photo", default: "image/upload/v1582613499/default_annonce.png"
    t.string "photo1", default: "image/upload/v1582613499/default_annonce.png"
    t.float "latitude"
    t.float "longitude"
    t.string "agent_user_id"
    t.string "checkout_agent"
    t.string "checkout_proprio"
    t.string "photo2", default: "image/upload/v1582613499/default_annonce.png"
    t.string "photo3", default: "image/upload/v1582613499/default_annonce.png"
    t.string "photo4", default: "image/upload/v1582613499/default_annonce.png"
    t.integer "price_cents", default: 0, null: false
    t.integer "pièces"
    t.integer "charges"
    t.string "agent", default: "Non"
    t.string "nom_proprio"
    t.string "prenom_proprio"
    t.string "email_proprio"
    t.string "telephone_proprio"
    t.boolean "mandat_exclusif", default: false
    t.integer "depot_garantie"
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
    t.string "statut"
    t.bigint "annonce_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "commentaire"
    t.index ["annonce_id"], name: "index_candidatures_on_annonce_id"
    t.index ["user_id"], name: "index_candidatures_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "telephone"
    t.string "email"
    t.string "ville"
    t.boolean "actualite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contrats", force: :cascade do |t|
    t.bigint "locataire_candidature_id"
    t.bigint "user_id"
    t.string "qualite_bailleur"
    t.string "nom_bailleur"
    t.string "denomination_bailleur"
    t.string "adresse_bailleur"
    t.string "email_bailleur"
    t.boolean "mandataire"
    t.string "nom_mandataire"
    t.string "denomination_mandataire"
    t.string "adresse_mandataire"
    t.string "activite_mandataire"
    t.string "carte_pro"
    t.text "nom_locataire", default: [], array: true
    t.string "adresse_logement"
    t.string "type_habitat_immeuble"
    t.string "type_habitat"
    t.string "periode_construction"
    t.integer "surface"
    t.integer "nb_piece"
    t.text "autre_partie_logement", default: [], array: true
    t.string "equipement"
    t.string "chauffage"
    t.string "eau_chaude"
    t.string "destination_locaux"
    t.boolean "cave"
    t.string "cave_detail"
    t.boolean "parking"
    t.string "parking_detail"
    t.boolean "garage"
    t.string "garage_detail"
    t.boolean "autre_partie_privative"
    t.string "autre_partie_privative_detail"
    t.text "partie_commune", default: [], array: true
    t.string "autre_partie_commune"
    t.string "equipement_technologique"
    t.string "date_prise_effet"
    t.string "duree_contrat"
    t.string "nb_duree_reduite"
    t.text "justif_duree_reduite"
    t.integer "loyer_mensuel"
    t.boolean "decret_evolution_loyer"
    t.boolean "loyer_reference"
    t.string "montant_loyer_reference"
    t.string "montant_loyer_majore"
    t.text "justif_complement_loyer"
    t.text "loyer_dernier_locataire"
    t.string "date_revision_loyer"
    t.string "reference_irl"
    t.string "modalite_paiement_charges"
    t.string "provision_charges"
    t.string "modalite_revision_forfait"
    t.string "contribution_economie_charge"
    t.string "justif_contribution_travaux"
    t.boolean "colocation_assurance"
    t.string "montant_annuel_assurance"
    t.string "montant_mensuel_assurance"
    t.string "perdiodicite_paiement"
    t.string "paiement_echoir_echu"
    t.string "date_periode_paiement"
    t.string "lieu_paiement"
    t.integer "loyer_hors_charges"
    t.integer "charge_recuperable"
    t.string "contribution_partage_economie_charges"
    t.string "colocation_assurance_recuperable"
    t.string "hausse_baisse_loyer"
    t.string "modalite_hausse_annuelle"
    t.text "travaux_amelioration"
    t.text "travaux_majoration_loyer"
    t.text "travaux_diminution_loyer"
    t.integer "depot_garantie"
    t.integer "honoraires_visite_bail"
    t.integer "honoraires_etat_lieux"
    t.string "honoraires_autres"
    t.text "autre_condition"
    t.string "date_signature"
    t.string "lieu_signature"
    t.boolean "signature_bailleur"
    t.boolean "signature_locataire"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "garant"
    t.string "societe_civile"
    t.string "autre_autre_partie_logement"
    t.text "contrat_type"
    t.string "date_naissance_bailleur"
    t.string "lieu_naissance_bailleur"
    t.text "clause_solidarite"
    t.text "clause_resolutoire"
    t.text "caution_solidaire"
    t.text "autre_info"
    t.string "civilite_locataire"
    t.string "date_naissance_locataire"
    t.string "lieu_naissance_locataire"
    t.text "consistance_logement"
    t.text "garantie_duree"
    t.text "plafond_applicable"
    t.text "domicile_locataire"
    t.decimal "honoraire_bailleur", precision: 10, scale: 2
    t.text "honoraire_bailleur_detail"
    t.decimal "honoraire_locataire", precision: 10, scale: 2
    t.text "honoraire_locataire_detail"
    t.boolean "statut_contrat", default: false
    t.index ["locataire_candidature_id"], name: "index_contrats_on_locataire_candidature_id"
    t.index ["user_id"], name: "index_contrats_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "titre"
    t.string "piece_jointe", default: "image/upload/v1582613499/default_annonce.png"
    t.bigint "locataire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locataire_id"], name: "index_documents_on_locataire_id"
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

  create_table "locataire_candidatures", force: :cascade do |t|
    t.string "agent", default: "Non"
    t.text "message"
    t.string "statut"
    t.string "statut_proprietaire"
    t.string "locataire_email"
    t.bigint "user_id"
    t.bigint "annonce_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "locataire_id"
    t.index ["annonce_id"], name: "index_locataire_candidatures_on_annonce_id"
    t.index ["user_id"], name: "index_locataire_candidatures_on_user_id"
  end

  create_table "locataire_supplementaires", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.bigint "locataire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "adresse"
    t.string "ville"
    t.string "tel"
    t.string "email"
    t.string "id_recto", default: "image/upload/v1582613499/default_annonce.png"
    t.string "id_verso", default: "image/upload/v1582613499/default_annonce.png"
    t.string "justif_dom", default: "image/upload/v1582613499/default_annonce.png"
    t.string "fiche_paye_mois1", default: "image/upload/v1582613499/default_annonce.png"
    t.string "fiche_paye_mois2", default: "image/upload/v1582613499/default_annonce.png"
    t.string "fiche_paye_mois3", default: "image/upload/v1582613499/default_annonce.png"
    t.string "contrat", default: "image/upload/v1582613499/default_annonce.png"
    t.string "activite"
    t.string "activite_autre"
    t.string "type_contrat"
    t.string "revenus"
    t.index ["locataire_id"], name: "index_locataire_supplementaires_on_locataire_id"
  end

  create_table "locataires", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "adresse"
    t.string "ville"
    t.string "tel"
    t.string "email"
    t.string "id_recto", default: "image/upload/v1582613499/default_annonce.png"
    t.string "id_verso", default: "image/upload/v1582613499/default_annonce.png"
    t.string "justif_dom", default: "image/upload/v1582613499/default_annonce.png"
    t.string "fiche_paye_mois1", default: "image/upload/v1582613499/default_annonce.png"
    t.string "fiche_paye_mois2", default: "image/upload/v1582613499/default_annonce.png"
    t.string "fiche_paye_mois3", default: "image/upload/v1582613499/default_annonce.png"
    t.string "contrat", default: "image/upload/v1582613499/default_annonce.png"
    t.string "nom_garant"
    t.string "prenom_garant"
    t.string "adresse_garant"
    t.string "ville_garant"
    t.string "tel_garant"
    t.string "email_garant"
    t.string "id_recto_garant", default: "image/upload/v1582613499/default_annonce.png"
    t.string "id_verso_garant", default: "image/upload/v1582613499/default_annonce.png"
    t.string "justif_dom_garant", default: "image/upload/v1582613499/default_annonce.png"
    t.string "fiche_paye_mois1_garant", default: "image/upload/v1582613499/default_annonce.png"
    t.string "fiche_paye_mois2_garant", default: "image/upload/v1582613499/default_annonce.png"
    t.string "fiche_paye_mois3_garant", default: "image/upload/v1582613499/default_annonce.png"
    t.string "contrat_garant", default: "image/upload/v1575902902/default_annonce.png"
    t.text "message"
    t.string "statut"
    t.string "statut_proprietaire"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "agent", default: "Non"
    t.string "activite"
    t.string "activite_autre"
    t.string "type_contrat"
    t.string "revenus"
    t.string "activite_garant"
    t.string "activite_autre_garant"
    t.string "type_contrat_garant"
    t.string "revenus_garant"
    t.string "drive"
    t.index ["user_id"], name: "index_locataires_on_user_id"
  end

  create_table "mailboxer_conversation_opt_outs", id: :serial, force: :cascade do |t|
    t.string "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", id: :serial, force: :cascade do |t|
    t.string "subject", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_notifications", id: :serial, force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.string "subject", default: ""
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "conversation_id"
    t.boolean "draft", default: false
    t.string "notification_code"
    t.string "notified_object_type"
    t.integer "notified_object_id"
    t.string "attachment"
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.boolean "global", default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", id: :serial, force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id"
    t.integer "notification_id", null: false
    t.boolean "is_read", default: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.string "mailbox_type", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_delivered", default: false
    t.string "delivery_method"
    t.string "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
  end

  create_table "mandats", force: :cascade do |t|
    t.boolean "acceptation_proprio"
    t.boolean "acceptation_agent"
    t.string "statut"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "annonce_id"
    t.index ["annonce_id"], name: "index_mandats_on_annonce_id"
    t.index ["user_id"], name: "index_mandats_on_user_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.text "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "annonce_id"
    t.string "prenom_prospect"
    t.string "nom_prospect"
    t.string "telephone"
    t.string "email"
    t.index ["annonce_id"], name: "index_meetings_on_annonce_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "parrains", force: :cascade do |t|
    t.string "prenom"
    t.string "nom"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parrains_on_user_id"
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

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "rating", default: 1
    t.bigint "agent_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_reviews_on_agent_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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
    t.string "téléphone"
    t.string "photo", default: "image/upload/v1579358933/default_profile.png"
    t.float "latitude"
    t.float "longitude"
    t.string "statut"
    t.boolean "admin", default: false
    t.datetime "deleted_at"
    t.string "parrain"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "annonces", "users"
  add_foreign_key "availabilities", "users"
  add_foreign_key "candidatures", "annonces"
  add_foreign_key "candidatures", "users"
  add_foreign_key "documents", "locataires"
  add_foreign_key "locataire_candidatures", "annonces"
  add_foreign_key "locataire_candidatures", "users"
  add_foreign_key "locataire_supplementaires", "locataires"
  add_foreign_key "locataires", "users"
  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "mandats", "users"
  add_foreign_key "orders", "annonces"
  add_foreign_key "orders", "users"
  add_foreign_key "parrains", "users"
  add_foreign_key "pictures", "annonces"
  add_foreign_key "reviews", "agents"
  add_foreign_key "reviews", "users"
end
