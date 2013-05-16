require "test_helper"

module UniversalIdentifiable

  class UniversalIdentifiableTest < TestCase

    before do
      Airport.delete_all
      @identifiable_model = Airport.new(:uuid => "dortmund")
    end

    it "is valid" do
      assert @identifiable_model.valid?

      refute @identifiable_model.errors.full_messages.any? do |message|
        message.include? "uuid"
      end
    end

    it "must have attributes present" do
      @identifiable_model.uuid = nil
      refute @identifiable_model.valid?

      assert @identifiable_model.errors.full_messages.any? do |message|
        message.include? "blank"
      end
    end

    it "must be unique" do
      @identifiable_model.save!

      new_model = Airport.new
      new_model.uuid = @identifiable_model.uuid(:namespaced => false)
      refute new_model.valid?

      assert new_model.errors.full_messages.any? do |message|
        message.include? "taken"
      end
    end

    it "has different uuid formats" do
      assert_equal "airport#{UniversalIdentifiable::NAMESPACER}dortmund", @identifiable_model.uuid

      assert_equal "dortmund", @identifiable_model.uuid(:namespaced => false)
      assert_equal "airport#{UniversalIdentifiable::NAMESPACER}dortmund", @identifiable_model.uuid(:namespaced => true)
    end

    it "prefixes uuid with class name" do
      airport = Airport.create(:uuid => "dortmund")

      assert_equal "airport#{UniversalIdentifiable::NAMESPACER}dortmund", airport.uuid(:namespaced => true)
      airport.uuid = "dusseldorf"
      assert_equal "airport#{UniversalIdentifiable::NAMESPACER}dusseldorf", airport.uuid(:namespaced => true)
      airport.update_attribute(:uuid, "dortmund")
      assert_equal "airport#{UniversalIdentifiable::NAMESPACER}dortmund", airport.uuid(:namespaced => true)
      airport.update_attributes(:uuid => "dusseldorf")
      assert_equal "airport#{UniversalIdentifiable::NAMESPACER}dusseldorf", airport.uuid(:namespaced => true)
    end

    it "anything preceeding first namespacer is considered to be the uuid" do
      airport = Airport.new(:uuid => "dortmund.foo.bar")

      assert_equal "airport#{UniversalIdentifiable::NAMESPACER}dortmund.foo.bar", airport.uuid(:namespaced => true)
      assert_equal "dortmund.foo.bar", airport.uuid(:namespaced => false)

      airport.uuid = ""
      assert_equal "", airport.uuid(:namespaced => false)

      airport.uuid = nil
      assert_equal nil, airport.uuid(:namespaced => false)
    end

  end

end