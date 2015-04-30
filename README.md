# pan cookbook generator

Pan is an example cookbook generator. Use this example to create your organization's own custom cookbook generator.

## Supported Platforms

### Tested And Validated On
* Mac OSX 10.10 with ChefDK 0.5.0
* Windows 7 with ChefDK 0.5.0

## Usage

While in the directory you wish to create your cookbook:

`chef generate cookbook my_cookbook_name -g ~/path/to/pan`

or you want to be super fancy, add pan to your knife.rb for usage without the -g argument:

knife.rb stub:

`chefdk.generator_cookbook '~/chef/pan'`

Then when you're ready to generate your cookbook:

```chef generate cookbook my_cookbook3```

```
Davids-MacBook-Pro:desktop echohack$ chef generate cookbook my_cookbook3
Compiling Cookbooks...
Recipe: pan::cookbook
  * directory[/Users/echohack/Desktop/my_cookbook3/attributes] action create
    - create new directory /Users/echohack/Desktop/my_cookbook3/attributes
  * directory[/Users/echohack/Desktop/my_cookbook3/recipes] action create
    - create new directory /Users/echohack/Desktop/my_cookbook3/recipes
  * directory[/Users/echohack/Desktop/my_cookbook3/templates/default] action create
    - create new directory /Users/echohack/Desktop/my_cookbook3/templates/default
  * directory[/Users/echohack/Desktop/my_cookbook3/files/default] action create
    - create new directory /Users/echohack/Desktop/my_cookbook3/files/default
  * directory[/Users/echohack/Desktop/my_cookbook3/test/integration/default] action create
    - create new directory /Users/echohack/Desktop/my_cookbook3/test/integration/default
  * cookbook_file[/Users/echohack/Desktop/my_cookbook3/.rubocop.yml] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/.rubocop.yml
    - update content in file /Users/echohack/Desktop/my_cookbook3/.rubocop.yml from none to fb555e
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook3/Berksfile] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/Berksfile
    - update content in file /Users/echohack/Desktop/my_cookbook3/Berksfile from none to 5ec92e
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook3/chefignore] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/chefignore
    - update content in file /Users/echohack/Desktop/my_cookbook3/chefignore from none to 9727b1
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook3/Gemfile] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/Gemfile
    - update content in file /Users/echohack/Desktop/my_cookbook3/Gemfile from none to a3b439
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook3/LICENSE] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/LICENSE
    - update content in file /Users/echohack/Desktop/my_cookbook3/LICENSE from none to 693e85
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook3/Thorfile] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/Thorfile
    - update content in file /Users/echohack/Desktop/my_cookbook3/Thorfile from none to bab8d2
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook3/metadata.rb] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/metadata.rb
    - update content in file /Users/echohack/Desktop/my_cookbook3/metadata.rb from none to 95b0c0
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook3/README.md] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/README.md
    - update content in file /Users/echohack/Desktop/my_cookbook3/README.md from none to 5b81bf
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook3/CHANGELOG.md] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/CHANGELOG.md
    - update content in file /Users/echohack/Desktop/my_cookbook3/CHANGELOG.md from none to 0404f5
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook3/.kitchen.yml] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/.kitchen.yml
    - update content in file /Users/echohack/Desktop/my_cookbook3/.kitchen.yml from none to 1338ed
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook3/attributes/default.rb] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/attributes/default.rb
    - update content in file /Users/echohack/Desktop/my_cookbook3/attributes/default.rb from none to cdc111
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook3/recipes/default.rb] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook3/recipes/default.rb
    - update content in file /Users/echohack/Desktop/my_cookbook3/recipes/default.rb from none to e3b0c4
    (diff output suppressed by config)
```
## Examples

* Create a cookbook named my_cookbook_name in the same subdirectory where pan resides, explicitly specifying the custom generator cookbook.

(Mac & Windows): `chef generate cookbook my_cookbook_name -g ./pan`

* Create a cookbook named my_cookbook_name in the same subdirectory where pan resides, with the custom generator cookbook specified in your knife.rb.

(Mac & Windows): `chef generate cookbook my_cookbook_name

* Create a cookbook named my_cookbook_name in the root of your primary drive with pan residing in your home directory

(Mac): `chef generate cookbook /mycookbook -g ~/pan`

(Windows): `chef generate cookbook C:\mycookbook -g %USERPROFILE%\pan`

## Stuff This Custom Generator Does

Things you might not be familiar with that this generator creates:

### In metadata.md

1. IO.read(File.join(File.dirname(__FILE__), 'README.md'))

  * A hack to force Chef Manage to display the contents of the README.md.

2. Text isn't aligned

  * This blows up rubocop, and I'd rather have it more standardized. Just say no to vertical whitespace. ;)

### In default_attributes.rb

1. default['<%= @attribute_context %>']['file_cache_path']

  * I like to do this so that I can create a "workspace" for the cookbook to drop any files in so I avoid cookbook download collisions. If your cookbook doesn't download anything, than you can trash this.
  * It also provides a good example of how to do an attribute.

### In .kitchen.yml

1. chef_zero provisioner

  * It's probably stronger to provision with chef_zero than chef_solo since it behaves more like the server does. (That is to say, if you use chef server, then test with chef zero. If you're using solo, then test with solo.)

2. Windows 2012 R2 with automagical WinRM transport
  * Ideally this is how you would set up the transport for WinRM with Kitchen. This is a new feature as of Test Kitchen 1.4.0 / ChefDK 0.5.0.

### In cookbook.rb

* I think it's better to create the items in the cookbook by using data driven patterns, so if you add something new it's fairly simple. The patterns speak for themselves. Perhaps there's a better way still.

* Using the :create_if_missing action is stronger here because you can use it to stub out already existing cookbooks without blowing up existing work. Because we use :create_if_missing you can use this as a code review tool as well.
