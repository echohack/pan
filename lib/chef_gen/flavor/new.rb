require 'chef_gen/flavor_base'
require 'chef_gen/snippets'

module ChefGen
  module Flavor
    class PanNew < FlavorBase
      include ChefGen::Snippet::StyleRubocop
      VERSION = '1.0.0'
      class << self
        def description
          'New cookbook with basic defaults.'
        end

        def code_generator_path(classfile)
          File.expand_path(
            File.join(classfile, '..', '..', '..', '..', 'new', 'code_generator')
          )
        end
      end
    end
  end
end
