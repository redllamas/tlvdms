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

ActiveRecord::Schema[8.0].define(version: 2025_10_03_095800) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "datasheets", force: :cascade do |t|
    t.string "doc_no", null: false
    t.string "title", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "category"
    t.string "body_material"
    t.string "applicable_fluids", default: [], array: true
    t.decimal "pmo", precision: 6, scale: 3
    t.integer "tmo"
    t.decimal "pma", precision: 6, scale: 3
    t.integer "tma"
    t.integer "status", default: 1, null: false
    t.jsonb "extras", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicable_fluids"], name: "index_products_on_applicable_fluids", using: :gin
    t.index ["status"], name: "index_products_on_status"
    t.check_constraint "pma IS NULL OR pma >= 0::numeric", name: "pma_nonneg"
    t.check_constraint "pmo IS NULL OR pmo >= 0::numeric", name: "pmo_nonneg"
    t.check_constraint "tma IS NULL OR tma >= 0", name: "tma_nonneg"
    t.check_constraint "tmo IS NULL OR tmo >= 0", name: "tmo_nonneg"
  end
end
