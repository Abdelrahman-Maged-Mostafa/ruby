# app/controllers/admin_controller.rb
class AdminController < ApplicationController
  def migrate
    ActiveRecord::MigrationContext.new("db/migrate", ActiveRecord::SchemaMigration).migrate
    render plain: "Migrations ran!"
  end
end