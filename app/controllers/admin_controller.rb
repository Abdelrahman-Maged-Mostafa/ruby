class AdminController < ApplicationController
  def migrate
    ActiveRecord::Base.connection.migration_context.migrate
    render plain: "Migrations ran!"
  end
end