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

ActiveRecord::Schema.define(version: 20180813234229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "customers", force: :cascade do |t|
    t.citext "first_name"
    t.citext "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "invoice_id"
    t.integer "quantity"
    t.integer "unit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "merchant_id"
    t.citext "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.citext "name"
    t.citext "description"
    t.integer "unit_price"
    t.bigint "merchant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", force: :cascade do |t|
    t.citext "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "invoice_id"
    t.bigint "credit_card_number"
    t.datetime "credit_card_expiration_date"
    t.citext "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
