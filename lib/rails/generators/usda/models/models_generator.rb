module Usda
  module Generators
    class ModelsGenerator < Rails::Generators::Base
      desc 'Creates models under the Usda namespace to be loaded with USDA data'

      def create_usda_models
        template 'food.rb', File.join('app', 'models', 'usda', 'food.rb')
        #todo - other models
      end
    end
  end
end

