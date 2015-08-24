require_relative './item'
require_relative './util'

module OneDriveForBusiness
  class File < Item
    include Util

    def initialize(drive, fields)
      @content_url = fields['content_url']
      @image = ImageFacet.new(fields['image']) if fields['image']
      super
    end

    def download!
      url = "#{drive.url}/Files/#{id}/content"
      http(url).get(url, 'authorization' => "Bearer #{drive.access_token}").body
    end
  end
end
