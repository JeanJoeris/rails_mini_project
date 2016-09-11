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

ActiveRecord::Schema.define(version: 20160911170433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string   "name"
    t.integer  "legs"
    t.boolean  "poisonous"
    t.boolean  "warm_blooded"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_path"
    t.integer  "kingdom_id"
    t.integer  "phylum_id"
    t.integer  "taxonomical_class_id"
    t.index ["kingdom_id"], name: "index_animals_on_kingdom_id", using: :btree
    t.index ["phylum_id"], name: "index_animals_on_phylum_id", using: :btree
    t.index ["taxonomical_class_id"], name: "index_animals_on_taxonomical_class_id", using: :btree
  end

  create_table "kingdoms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phylums", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sightings", force: :cascade do |t|
    t.integer  "animal_id"
    t.integer  "location_id"
    t.datetime "sighting_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.index ["animal_id"], name: "index_sightings_on_animal_id", using: :btree
    t.index ["location_id"], name: "index_sightings_on_location_id", using: :btree
    t.index ["user_id"], name: "index_sightings_on_user_id", using: :btree
  end

  create_table "taxonomical_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "password_confirmation"
    t.integer  "role",                  default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_foreign_key "animals", "kingdoms"
  add_foreign_key "animals", "phylums"
  add_foreign_key "animals", "taxonomical_classes"
  add_foreign_key "sightings", "animals"
  add_foreign_key "sightings", "locations"
  add_foreign_key "sightings", "users"
end
