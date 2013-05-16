require "universal_identifiable/version"
require 'active_record'
require 'active_support/core_ext/string'

module UniversalIdentifiable

  NAMESPACER = "."
  REGEX      = Regexp.new("\\#{NAMESPACER}(.*)")

  def self.included(base)
    base.validates :uuid, :presence => true, :uniqueness => true
  end

  def uuid(options={})
    options[:namespaced] = true if options[:namespaced].nil?
    options[:namespaced] ? read_attribute(:uuid) : short_uuid
  end

  def uuid=(uuid)
    uuid = "#{self.class.name.underscore}#{NAMESPACER}#{uuid}" if uuid
    super uuid
  end

  private

  def short_uuid
    value = read_attribute(:uuid)
    value.match(REGEX)[1] if value
  end

end
