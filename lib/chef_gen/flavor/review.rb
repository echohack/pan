require 'chef_gen/flavor_base'
require 'chef_gen/snippets'

module ChefGen
  module Flavor
    class PanReview < FlavorBase
      include ChefGen::Snippet::StyleRubocop
      VERSION = '1.0.0'
      class << self
        def description
          'Review an existing cookbook and validate its correctness.'
        end

        def code_generator_path(classfile)
          File.expand_path(
            File.join(classfile, '..', '..', '..', '..', 'review', 'code_generator')
          )
        end
      end
    end
  end
end
