require_relative './util'

module OneDriveForBusiness
  class Drive
    include Util

    # @return Drive
    def initialize(tenant, access_token)
      @url = "https://#{tenant}-my.sharepoint.com/_api/v1.0/me/drive"
      @access_token = access_token
    end

    attr_reader :access_token
    attr_reader :url

    # @return String
    def id
      fetch_properties! unless @id
      @id
    end

    # @return Identity
    def owner
      fetch_properties! unless @owner
      @owner
    end

    # @return Drive::Quota
    def quota
      fetch_properties! unless @quota
      @quota
    end

    class Quota
      def initialize(fields)
        @deleted = fields['deleted']
        @remaining = fields['remaining']
        @state = fields['state']
        @total = fields['total']
      end

      attr_reader :deleted
      attr_reader :remaining
      attr_reader :state
      attr_reader :total
    end

    private

    def fetch_properties!
      resp = http(url).get(url, 'authorization' => "Bearer #{@access_token}")
      if resp.code.to_i != 200
        # TODO(aj-michael) Add better error.
        fail "Unauthorized request: #{resp.body}."
      end
      resp_hash = JSON.parse(resp.body)
      @id = resp_hash['id']
      @quota = Drive::Quota.new(resp_hash['quota'])
      @owner = Identity.new(resp_hash['owner'])
    end
  end
end
