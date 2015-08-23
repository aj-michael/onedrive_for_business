module OneDriveForBusiness
  class ItemReference
    def initialize(fields)
      @drive_id = fields['driveId']
      @id = fields['id']
      @path = fields['path']
    end

    attr_reader :drive_id   # String
    attr_reader :id         # String
    attr_reader :path       # String
  end
end
