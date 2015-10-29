context = ChefDK::Generator.context
cookbook_dir = File.join(context.cookbook_root, context.cookbook_name)
attribute_context = context.cookbook_name.gsub(/-/, '_')

# Create cookbook directories
cookbook_directories = [
  'attributes',
  'recipes',
  'templates/default',
  'files/default',
  'test/integration/default'
]
cookbook_directories.each do |dir|
  directory File.join(cookbook_dir, dir) do
    recursive true
  end
end

# Enforce required files
files_basic = %w(
  chefignore
  LICENSE
  gitignore
)
files_basic.each do |file|
  cookbook_file File.join(cookbook_dir, file) do
    action :create
  end
end
