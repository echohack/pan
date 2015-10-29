require 'chef_gen/helpers/copy_helpers'

module ChefGen
  module Flavor
    class PanBase
      include ChefGen::CopyHelpers

      NAME = 'pan_base'
      DESC = 'Generate a base cookbook for organization wide policy.'
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
