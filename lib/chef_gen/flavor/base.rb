require 'chef_gen/flavor_base'
require 'chef_gen/snippets'

module ChefGen
  module Flavor
    class PanBase < FlavorBase
      include ChefGen::Snippet::StyleRubocop
      VERSION = '1.0.0'
      class << self
        def description
          'Generate a base cookbook for organization wide policy.'
        end

        def code_generator_path(classfile)
          File.expand_path(
            File.join(classfile, '..', '..', '..', '..', 'base', 'code_generator')
          )
        end
      end
    end
  end
end
