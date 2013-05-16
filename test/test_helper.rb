require 'rails'
require 'minitest/autorun'
require 'minitest/spec'
require 'universal_identifiable'

class TestCase < Minitest::Spec
end

class Airport < ActiveRecord::Base
  include UniversalIdentifiable
end

ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => ':memory:'
)

ActiveRecord::Schema.define do
  self.verbose = false

  create_table :airports, :force => true do |t|
    t.string :uuid
  end
end