require 'chef_gen/flavor_base'
require 'chef_gen/snippets'

module ChefGen
  module Flavor
    class PanNew < ChefGen::FlavorBase
      NAME = 'pan_new'
      DESC = 'Generate a new cookbook with good defaults.'
      VERSION = '1.0.0'

      def initialize(temp_path: nil, type: nil, recipe: nil)
        super
      end

      do_add_content do
        @tocopy << [File.expand_path(File.join(static_content_path(__FILE__, 'new'))) + '/.']
      end
    end
  end
end
