require_relative './item'
require_relative './util'

module OneDriveForBusiness
  class Folder < Item
    include Util

    class << self
      include Util
    end

    # @return Folder
    def self.create_with_parent_id!(drive, parent_id, name)
      url = "#{drive.url}/files/#{parent_id}/children/#{name}"
      resp =
        http(url).put(url, nil, 'authorization' => "Bearer #{drive.access_token}")
      Folder.new(drive, JSON.parse(resp.body))
    end

    # @return Folder
    def self.create_with_path!(drive, path)
      url = "#{drive.url}/files/getbypath('#{path}')"
      resp = http(url).put(
        url, nil, 'authorization' => "Bearer #{drive.access_token}")
      Folder.new(drive, JSON.parse(resp.body))
    end

    # @return Folder
    def self.get_by_id(drive, id)
      url = "#{drive.url}/files/#{id}"
      resp = http(url).get(
        url, 'authorization' => "Bearer #{drive.access_token}")
      Folder.new(drive, JSON.parse(resp.body))
    end

    # @return Folder
    def self.get_by_path(drive, path)
      url = "#{drive.url}/files/getbypath('#{path}')"
      resp = http(url).get(
        url, 'authorization' => "Bearer #{drive.access_token}")
      Folder.new(drive, JSON.parse(resp.body))
    end

    def initialize(drive, fields)
      @child_count = fields['childCount']
      @children = fields['children']
      super
    end

    attr_reader :child_count    # FixNum
    attr_reader :children       # Array[Item]

    def contents
      @contents ||= contents!
    end

    def contents!
      url = "#{drive.url}/Files/#{id}/children"
      resp = http(url).get(
        url, 'authorization' => "Bearer #{drive.access_token}")
      File.new(drive, JSON.parse(resp.body))
    end
  end
end
