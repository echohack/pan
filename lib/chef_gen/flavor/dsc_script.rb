require 'chef_gen/helpers/copy_helpers'

module ChefGen
  module Flavor
    class PanDscScript
      include ChefGen::CopyHelpers

      NAME = 'pan_dsc_script'
      DESC = 'Generate an example cookbook that uses dsc_script.'
      VERSION = '1.0.0'

      def initialize(temp_path:)
        @temp_path = temp_path
      end

      def add_content
        copy_content(NAME)
      end
    end
  end
end
