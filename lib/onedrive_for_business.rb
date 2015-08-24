Dir[File.expand_path('../onedrive_for_business/*.rb', __FILE__)].each do |f|
  require_relative f
end

module OneDriveForBusiness
  class NameAlreadyExistsError < StandardError; end
end
