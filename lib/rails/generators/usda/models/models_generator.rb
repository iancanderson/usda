module Usda
  module Generators
    class ModelsGenerator < Rails::Generators::Base
      desc 'Creates models under the Usda namespace to be loaded with USDA data'

      def self.source_root
        File.expand_path("../templates", __FILE__)
      end

      def create_usda_models
        schema = YAML.load(File.open(File.join File.dirname(__FILE__), 'sr24_schema.yml'))
        schema.each do |data_file|
          fields = data_file['fields'].map do |field|
            "#{field['field_name']}:#{parse_field_type field['type']}"
          end
          generate("model", "Usda::#{data_file['model_name']} #{fields.join ' '}")
        end
      end

      private
        def parse_field_type(type)
          case type
          when /^A/ then 'string'
          when /^N\d?\./ then 'float'
          when /^N/ then 'integer'
          else
            raise "Failed parsing field_type #{type}"
          end
        end
    end
  end
end

