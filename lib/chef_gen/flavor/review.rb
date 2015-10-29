require 'chef_gen/helpers/copy_helpers'

module ChefGen
  module Flavor
    class PanReview
      include ChefGen::CopyHelpers

      NAME = 'pan_review'
      DESC = 'Review an existing cookbook and validate its correctness.'
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
