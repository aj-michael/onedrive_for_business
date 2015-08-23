require_relative './item'
require_relative './util'

module OneDriveForBusiness
  class Folder < Item
    class << self
      include Util
    end

    # @return Folder
    def self.create_with_parent_id!(drive, parent_id, name)
      url = "#{drive.url}/files/#{parent_id}/children/#{name}"
      resp =
        http(url).put(url, nil, 'authorization' => "Bearer #{drive.access_token}")
      Folder.new(JSON.parse(resp.body))
    end

    # @return Folder
    def self.create_with_path!(drive, path)
      url = "#{drive.url}/files/getbypath('#{path}')"
      resp =
        http(url).put(url, nil, 'authorization' => "Bearer #{drive.access_token}")
      Folder.new(JSON.parse(resp.body))
    end

    def initialize(fields)
      @child_count = fields['childCount']
      @children = fields['children']
    end

    attr_reader :child_count    # FixNum
    attr_reader :children       # Array[Item]
  end
end
