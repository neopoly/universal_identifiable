require "test_helper"

module UniversalIdentifiable

  class UniversalIdentifiableTest < TestCase

    before do
      @identifiable_model = FakeRecord.new(:uuid => "airport.dortmund")
    end

    it "is valid" do
      assert @identifiable_model.uuid

      @identifiable_model.valid?

      refute @identifiable_model.errors.full_messages.any? do |message|
        message.include? "uuid"
      end
    end

    it "must have attributes present" do
      @identifiable_model.uuid = nil
      @identifiable_model.valid?

      assert @identifiable_model.errors.full_messages.any? do |message|
        message.include? "blank"
      end
    end

    it "must be unique" do
      @identifiable_model.save!

      new_model = FakeRecord.new
      new_model.uuid = @identifiable_model.uuid
      new_model.valid?

      assert new_model.errors.full_messages.any? do |message|
        message.include? "taken"
      end
    end

    it "has different uuid formats" do
      assert_equal "airport.dortmund", @identifiable_model.uuid

      assert_equal "dortmund", @identifiable_model.uuid(:namespaced => false)
      assert_equal "airport.dortmund", @identifiable_model.uuid(:namespaced => true)
    end

  end

end