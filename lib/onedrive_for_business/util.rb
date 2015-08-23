module OneDriveForBusiness
  module Util
    # @param String|URI
    # @return Net::HTTP
    def http(uri)
      uri = URI(uri.to_s)
      http = Net::HTTP.new(uri.hostname, uri.port)
      http.use_ssl = true
      http
    end
  end
end
