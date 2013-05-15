require "test_helper"
require 'rails/generators'
require 'generators/uuid_generator'

class UuidGeneratorTest < Rails::Generators::TestCase

  tests UuidGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))

  setup :prepare_destination

  test 'create migration' do
    run_generator %w(Airport)

    assert_migration 'db/migrate/add_uuid_to_airports.rb' do |migration|
      assert_match /class AddUuidToAirports/, migration
      assert_match /add_column :airports, :uuid, :string/, migration
      assert_match /add_index :airports, :uuid, :unique => true/, migration
    end
  end

end