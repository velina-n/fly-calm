# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_11_26_104655) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "documents", force: :cascade do |t|
    t.integer "kind", default: 0, null: false
    t.string "title"
    t.text "content"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fears", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fears_documents", force: :cascade do |t|
    t.bigint "fear_id", null: false
    t.bigint "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_fears_documents_on_document_id"
    t.index ["fear_id"], name: "index_fears_documents_on_fear_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "journeys_documents", force: :cascade do |t|
    t.bigint "journey_id", null: false
    t.bigint "document_id", null: false
    t.integer "position"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_journeys_documents_on_document_id"
    t.index ["journey_id"], name: "index_journeys_documents_on_journey_id"
  end

  create_table "journeys_fears", force: :cascade do |t|
    t.bigint "journey_id", null: false
    t.bigint "fear_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fear_id"], name: "index_journeys_fears_on_fear_id"
    t.index ["journey_id"], name: "index_journeys_fears_on_journey_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.bigint "document_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_questions_on_document_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "fears_documents", "documents"
  add_foreign_key "fears_documents", "fears"
  add_foreign_key "journeys", "users"
  add_foreign_key "journeys_documents", "documents"
  add_foreign_key "journeys_documents", "journeys"
  add_foreign_key "journeys_fears", "fears"
  add_foreign_key "journeys_fears", "journeys"
  add_foreign_key "questions", "documents"
end
