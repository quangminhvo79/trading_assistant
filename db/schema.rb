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

ActiveRecord::Schema[8.0].define(version: 2025_05_20_141843) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "orders", force: :cascade do |t|
    t.bigint "token_id"
    t.decimal "usdt_amount", precision: 16, scale: 4
    t.decimal "token_amount", precision: 16, scale: 8
    t.decimal "entry_price", precision: 16, scale: 8
    t.decimal "stoploss_price", precision: 16, scale: 8
    t.decimal "takeprofit_price", precision: 16, scale: 8
    t.float "risk_reward_ratio", default: 1.5
    t.string "status", default: "open"
    t.string "side", null: false
    t.string "order_type", default: "market"
    t.index ["token_id"], name: "index_orders_on_token_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name", null: false
    t.string "api_key"
    t.string "api_secret"
  end

  create_table "settings", force: :cascade do |t|
    t.string "key", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "symbol_name", null: false
    t.bigint "platform_id"
    t.boolean "enabled", default: true
    t.integer "volume_by_percent", default: 5
    t.integer "volume_by_value", default: 100
    t.string "volume_type", default: "percent"
    t.decimal "initial_balances", precision: 15, scale: 4, default: "1000.0"
    t.decimal "current_balances", precision: 15, scale: 4, default: "1000.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_tokens_on_platform_id"
  end

  add_foreign_key "orders", "tokens"
  add_foreign_key "tokens", "platforms"
end
