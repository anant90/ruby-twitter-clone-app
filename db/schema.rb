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

ActiveRecord::Schema.define(version: 2018_08_29_191035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_customuser", id: :serial, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.datetime "last_login"
    t.boolean "is_superuser", null: false
    t.string "email", limit: 254, null: false
    t.string "github_login", limit: 100
    t.text "avatar_url"
    t.string "name", limit: 150
    t.integer "bugs_count", null: false
    t.integer "enhancements_count", null: false
    t.integer "starred_repos_count", null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.datetime "date_joined", null: false
    t.string "github_access_token", limit: 255
    t.integer "total_issues_count", null: false
    t.integer "unassigned_issues_count", null: false
    t.datetime "last_synced"
    t.index ["email"], name: "api_customuser_email_18215455_like", opclass: :varchar_pattern_ops
    t.index ["email"], name: "api_customuser_email_key", unique: true
  end

  create_table "api_customuser_groups", id: :serial, force: :cascade do |t|
    t.integer "customuser_id", null: false
    t.integer "group_id", null: false
    t.index ["customuser_id", "group_id"], name: "api_customuser_groups_customuser_id_d5b0c2ab_uniq", unique: true
    t.index ["customuser_id"], name: "api_customuser_groups_721e74b0"
    t.index ["group_id"], name: "api_customuser_groups_0e939a4f"
  end

  create_table "api_customuser_user_permissions", id: :serial, force: :cascade do |t|
    t.integer "customuser_id", null: false
    t.integer "permission_id", null: false
    t.index ["customuser_id", "permission_id"], name: "api_customuser_user_permissions_customuser_id_9deacd8d_uniq", unique: true
    t.index ["customuser_id"], name: "api_customuser_user_permissions_721e74b0"
    t.index ["permission_id"], name: "api_customuser_user_permissions_8373b171"
  end

  create_table "api_issue", id: :serial, force: :cascade do |t|
    t.text "html_url"
    t.text "title"
    t.integer "number"
    t.date "github_created_at"
    t.integer "comments_count"
    t.boolean "isBug", null: false
    t.boolean "isEnhancement", null: false
    t.boolean "isAssigned", null: false
    t.integer "repo_id"
    t.string "assignee_login", limit: 100
    t.string "creator_login", limit: 100
    t.index ["repo_id"], name: "api_issue_9a8c79bf"
  end

  create_table "api_repo", id: :serial, force: :cascade do |t|
    t.text "html_url"
    t.string "full_name", limit: 100
  end

  create_table "api_repo_stargazers", id: :serial, force: :cascade do |t|
    t.integer "repo_id", null: false
    t.integer "customuser_id", null: false
    t.index ["customuser_id"], name: "api_repo_stargazers_721e74b0"
    t.index ["repo_id", "customuser_id"], name: "api_repo_stargazers_repo_id_2c49d15a_uniq", unique: true
    t.index ["repo_id"], name: "api_repo_stargazers_9a8c79bf"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "auth_group", id: :serial, force: :cascade do |t|
    t.string "name", limit: 80, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_0e939a4f"
    t.index ["permission_id"], name: "auth_group_permissions_8373b171"
  end

  create_table "auth_permission", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_417f1b1c"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "django_admin_log", id: :serial, force: :cascade do |t|
    t.datetime "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_417f1b1c"
    t.index ["user_id"], name: "django_admin_log_e8701ad4"
  end

  create_table "django_content_type", id: :serial, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :serial, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.datetime "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, force: :cascade do |t|
    t.text "session_data", null: false
    t.datetime "expire_date", null: false
    t.index ["expire_date"], name: "django_session_de54fa62"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "user_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "api_customuser_groups", "api_customuser", column: "customuser_id", name: "api_customuser_grou_customuser_id_9eb4b783_fk_api_customuser_id"
  add_foreign_key "api_customuser_groups", "auth_group", column: "group_id", name: "api_customuser_groups_group_id_f049027c_fk_auth_group_id"
  add_foreign_key "api_customuser_user_permissions", "api_customuser", column: "customuser_id", name: "api_customuser_user_customuser_id_5365c9ba_fk_api_customuser_id"
  add_foreign_key "api_customuser_user_permissions", "auth_permission", column: "permission_id", name: "api_customuser_use_permission_id_8735d73e_fk_auth_permission_id"
  add_foreign_key "api_issue", "api_repo", column: "repo_id", name: "api_issue_repo_id_44a2c1a9_fk_api_repo_id"
  add_foreign_key "api_repo_stargazers", "api_customuser", column: "customuser_id", name: "api_repo_stargazers_customuser_id_b5b09f6f_fk_api_customuser_id"
  add_foreign_key "api_repo_stargazers", "api_repo", column: "repo_id", name: "api_repo_stargazers_repo_id_b19bbe76_fk_api_repo_id"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id"
  add_foreign_key "comments", "articles"
  add_foreign_key "django_admin_log", "api_customuser", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_api_customuser_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_content_type_id_c4bce8eb_fk_django_content_type_id"
end
