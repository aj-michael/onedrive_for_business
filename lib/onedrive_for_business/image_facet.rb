module OneDriveForBusiness
  class ImageFacet
    def initialize(fields)
      @date_time_taken = fields['dateTimeTaken']
    end

    attr_reader :date_time_taken    # OneDriveForBusiness::DateTimeOffset
  end
end
