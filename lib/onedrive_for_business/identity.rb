module OneDriveForBusiness
  class Identity
    def initialize(fields)
      @id = fields['id']
      @display_name = fields['displayName']
    end

    attr_reader :id
    attr_reader :display_name
  end
end
