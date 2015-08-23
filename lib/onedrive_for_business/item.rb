module OneDriveForBusiness
  class Item
    def initialize(fields)
      @id = fields['id']
      @name = fields['name']
      @e_tag = fields['eTag']
      @created_by = IdentitySet.new(fields['createdBy'])
      @last_modified_by = IdentitySet.new(fields['lastModifiedBy'])
      @date_time_created = fields['dateTimeCreated']
      @date_time_last_modified = fields['dateTimeLastModified']
      @size = fields['size']
      @parent_reference = ItemReference.new(fields['parentReference'])
      @web_url = fields['webUrl']
      @type = fields['type']
    end

    FIELDS = [:id, :name, :e_tag, :created_by, :last_modified_by,
              :date_time_created, :date_time_last_modified,
              :size, :parent_reference, :web_url, :type]
    FIELDS.each { |f| attr_reader f }
  end
end
