require 'minitest/autorun'
require 'minitest/spec'
require 'universal_identifiable'

class TestCase < Minitest::Spec
end

class FakeRecord < ActiveRecord::Base
  include UniversalIdentifiable
end

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => ':memory:'
)

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :fake_records, :force => true do |t|
    t.string :uuid
  end
end