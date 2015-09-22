require 'chef_gen/flavor_base'
require 'chef_gen/snippets'

module ChefGen
  module Flavor
    class PanBase < ChefGen::FlavorBase
      NAME = 'pan_base'
      DESC = 'Generate a base cookbook for organization wide policy.'
      VERSION = '1.0.0'

      def initialize(temp_path: nil, type: nil, recipe: nil)
        super
      end

      do_add_content do
        @tocopy << [File.expand_path(File.join(static_content_path(__FILE__, 'base'))) + '/.']
      end
    end
  end
end
