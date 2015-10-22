# pan

Pan is a Chef cookbook generator using [chef-gen-flavors](https://rubygems.org/gems/chef-gen-flavors). You can use it out of the box as an opinionated way of creating new cookbooks, or modify it to meet your organization needs.

<sub><sup>パン</sup></sub>

## Features

- Automatically create boilerplate files for cookbooks.
- Drive organizational policy by setting standards and good defaults for what a cookbook should look like.
- Review existing cookbooks during code reviews or during your cookbook build.
- Automatically generate examples for developers brand new to Chef.

## Install

- Make sure you have ChefDK installed: https://downloads.chef.io/chef-dk/

- Then run this command:

`chef gem install chef-flavor-pan`

- Now add this to your knife.rb:

```
# only load ChefGen::Flavors if we're being called from the ChefDK CLI
if defined?(ChefDK::CLI)
  require 'chef_gen/flavors'
  chefdk.generator_cookbook = ChefGen::Flavors.path
end
```

- You're done! Let's get cooking.

## Usage

`chef generate cookbook my_cookbook_name`

```
[ChefGen Flavor Selector]: Flavors on the menu
1. pan_review: Review an existing cookbook and validate its correctness.
2. pan_new: Generate a new cookbook with good defaults.
3. pan_base: Generate a base cookbook for organization wide policy.
[ChefGen Flavor Selector]: Enter selection:
```

`2`

```
echohack:desktop echohack$ chef generate cookbook my_cookbook_name
Compiling Cookbooks...
Recipe: new::cookbook
  * directory[/Users/echohack/Desktop/my_cookbook_name/attributes] action create
    - create new directory /Users/echohack/Desktop/my_cookbook_name/attributes
  * directory[/Users/echohack/Desktop/my_cookbook_name/recipes] action create
    - create new directory /Users/echohack/Desktop/my_cookbook_name/recipes
  * directory[/Users/echohack/Desktop/my_cookbook_name/templates/default] action create
    - create new directory /Users/echohack/Desktop/my_cookbook_name/templates/default
  * directory[/Users/echohack/Desktop/my_cookbook_name/files/default] action create
    - create new directory /Users/echohack/Desktop/my_cookbook_name/files/default
  * directory[/Users/echohack/Desktop/my_cookbook_name/test/integration/default] action create
    - create new directory /Users/echohack/Desktop/my_cookbook_name/test/integration/default
  * cookbook_file[/Users/echohack/Desktop/my_cookbook_name/.rubocop.yml] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/.rubocop.yml
    - update content in file /Users/echohack/Desktop/my_cookbook_name/.rubocop.yml from none to fb555e
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook_name/Berksfile] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/Berksfile
    - update content in file /Users/echohack/Desktop/my_cookbook_name/Berksfile from none to 5ec92e
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook_name/chefignore] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/chefignore
    - update content in file /Users/echohack/Desktop/my_cookbook_name/chefignore from none to 9727b1
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook_name/Gemfile] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/Gemfile
    - update content in file /Users/echohack/Desktop/my_cookbook_name/Gemfile from none to a3b439
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook_name/LICENSE] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/LICENSE
    - update content in file /Users/echohack/Desktop/my_cookbook_name/LICENSE from none to 693e85
    (diff output suppressed by config)
  * cookbook_file[/Users/echohack/Desktop/my_cookbook_name/Thorfile] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/Thorfile
    - update content in file /Users/echohack/Desktop/my_cookbook_name/Thorfile from none to bab8d2
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook_name/metadata.rb] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/metadata.rb
    - update content in file /Users/echohack/Desktop/my_cookbook_name/metadata.rb from none to 95b0c0
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook_name/README.md] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/README.md
    - update content in file /Users/echohack/Desktop/my_cookbook_name/README.md from none to 5b81bf
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook_name/CHANGELOG.md] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/CHANGELOG.md
    - update content in file /Users/echohack/Desktop/my_cookbook_name/CHANGELOG.md from none to 0404f5
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook_name/.kitchen.yml] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/.kitchen.yml
    - update content in file /Users/echohack/Desktop/my_cookbook_name/.kitchen.yml from none to 1338ed
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook_name/attributes/default.rb] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/attributes/default.rb
    - update content in file /Users/echohack/Desktop/my_cookbook_name/attributes/default.rb from none to cdc111
    (diff output suppressed by config)
  * template[/Users/echohack/Desktop/my_cookbook_name/recipes/default.rb] action create_if_missing
    - create new file /Users/echohack/Desktop/my_cookbook_name/recipes/default.rb
    - update content in file /Users/echohack/Desktop/my_cookbook_name/recipes/default.rb from none to e3b0c4
    (diff output suppressed by config)
```

## Examples

* Create a cookbook named my_cookbook_name in the same subdirectory where pan resides.

(Mac & Windows): `chef generate cookbook my_cookbook_name`

## Supported Platforms

### Tested And Validated On
* Mac OSX 10.10 with ChefDK 0.9.0 and chef-gen-flavors 0.9.1
* Windows 7 with ChefDK 0.9.0 and chef-gen-flavors 0.9.1

ChefDK 0.3.6 and higher all likely work, but previous versions were not tested and validated.

## Stuff This Custom Generator Does

Take a look at the flavors and generate a few cookbooks to see what they do. But I'll mention some best practices here:

### In default_attributes.rb

1. default['<%= @attribute_context %>']['file_cache_path']

  * I like to do this so that I can create a "workspace" for the cookbook to drop any files in so I avoid cookbook download collisions. If your cookbook doesn't download anything, than you can trash this.
  * It also provides a good example of how to do an attribute.

### In .kitchen.yml

1. chef_zero provisioner

  * It's probably stronger to provision with chef_zero than chef_solo since it behaves more like the server does. (That is to say, if you use chef server, then test with chef zero. If you're using solo, then test with solo.)

2. Windows 2012 R2 with automagical WinRM transport
  * Ideally this is how you would set up the transport for WinRM with Kitchen. This is a new feature as of Test Kitchen 1.4.0 / ChefDK 0.5.0.
