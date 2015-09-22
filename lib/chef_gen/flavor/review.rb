require 'chef_gen/flavor_base'
require 'chef_gen/snippets'

module ChefGen
  module Flavor
    class PanReview < ChefGen::FlavorBase
      NAME = 'pan_review'
      DESC = 'Review an existing cookbook and validate its correctness.'
      VERSION = '1.0.0'

      def initialize(temp_path: nil, type: nil, recipe: nil)
        super
      end

      do_add_content do
        @tocopy << [File.expand_path(File.join(static_content_path(__FILE__, 'review'))) + '/.']
      end
    end
  end
end
