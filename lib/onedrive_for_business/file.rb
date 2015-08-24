module OneDriveForBusiness
  class File < Item
    def initialize(drive, fields)
      @content_url = fields['content_url']
      @image = ImageFacet.new(fields['image']) if fields['image']
      super
    end
  end
end
