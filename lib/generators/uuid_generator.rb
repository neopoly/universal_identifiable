require 'rails/generators/active_record'

class UuidGenerator < ActiveRecord::Generators::Base

  desc "Create a migration to add a uuid to your model. Pass your model name as an argument (required)."

  def self.source_root
    @source_root ||= File.expand_path('../templates', __FILE__)
  end

  def generate_migration
    migration_template "uuid_migration.rb.erb", "db/migrate/#{migration_file_name}"
  end

  private

  def migration_file_name
    "#{migration_name}.rb"
  end

  def migration_name
    "add_uuid_to_#{name.underscore.pluralize}"
  end

  def migration_class_name
    migration_name.camelize
  end

end