module ChefGen
  module CopyHelpers
    def copy_content(item_name)
      FileUtils.cp_r(
        File.expand_path(
          File.join(
            File.dirname(__FILE__),
            '..', '..', '..', 'flavor_cookbooks', item_name
          )
        ) + '/.',
        @temp_path
      )
    end
  end
end
