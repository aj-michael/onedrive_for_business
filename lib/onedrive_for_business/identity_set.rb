module OneDriveForBusiness
  class IdentitySet
    def initialize(fields)
      @application = Identity.new(fields['application'])
      @user = Identity.new(fields['user'])
    end

    attr_reader :application  # OneDriveForBusiness::Identity
    attr_reader :user         # OneDriveForBusiness::Identity
  end
end
