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


ActiveRecord::Schema.define(version: 20170213225955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.string   "date"
    t.string   "event_photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "content"
    t.string   "slug"
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "event_id", null: false
    t.index ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id", using: :btree
    t.index ["user_id", "event_id"], name: "index_events_users_on_user_id_and_event_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.string   "photo"
    t.string   "slug"
    t.index ["cached_votes_down"], name: "index_ideas_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_ideas_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_ideas_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_ideas_on_cached_votes_up", using: :btree
    t.index ["cached_weighted_average"], name: "index_ideas_on_cached_weighted_average", using: :btree
    t.index ["cached_weighted_score"], name: "index_ideas_on_cached_weighted_score", using: :btree
    t.index ["cached_weighted_total"], name: "index_ideas_on_cached_weighted_total", using: :btree
    t.index ["event_id"], name: "index_ideas_on_event_id", using: :btree
    t.index ["user_id"], name: "index_ideas_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "social_url"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "course"
    t.string   "password_digest"
    t.string   "photo"
    t.string   "password_confirmation"
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "ideas", "events"
  add_foreign_key "ideas", "users"
end
