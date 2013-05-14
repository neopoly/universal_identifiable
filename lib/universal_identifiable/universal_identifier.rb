module UniversalIdentifiable

  module UniversalIdentifier
    # sample uuid: 'hotel.ritz'
    # TODO: store underscored modelname as prefix automatically. e.G. '#{modelname}.ritz' when assigning attribute

    def self.included(base)
      base.validates :uuid, :presence => true, :uniqueness => true
    end

    def uuid(options={})
      options[:namespaced] = true if options[:namespaced].nil?
      options[:namespaced] ? read_attribute(:uuid) : short_uuid
    end

    private

    def short_uuid
      read_attribute(:uuid).split(".").last
    end
  end

end