module Sinatra
  module LinkHelper
    def link_to(url, body)
      "<a href='#{url}'>#{body}</a>"
    end

    def link_to(url_or_record, body)
      return "<a href='#{url_or_record}'>#{body}</a>" if url_or_record.is_a? String
      link_to(record_path(url_or_record), body)
    end

    def record_path(record)
      table_name = record.class.table_name
      record_id = record.record_id
      "/#{table_name}/#{record_id}"
    end

    def method_missing(*args)
      str = args[0].to_s
      if str[0..4] == 'new_' && str[-5..-1] == '_path'
      # return "/#{str[4..-6]}/new"
        resource = str[4..-6]
        super unless constant_defined?(resource)
        return new_resource_path(resource)
      elsif str[-5..-1] == '_path'
        resource = str[0..-6]
        super unless constant_defined?(resource)
        return resource_index_path(resource)
      else
        super
      end
    end

    def new_resource_path(resource)
      "/#{pluralize(resoure)}/new"
    end

    def resource_index_path(resource)
      "/#{pluralize(resource)}"
    end

    def constant_defined?(resource)
      resource = singularize(resource).capitalize
      Module.const_defined?(resource)
    end

  end
  helpers LinkHelper
end