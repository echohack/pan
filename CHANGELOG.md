# Pan Example Cookbook Generator

## Release 4.0.0 2015/10/29

* Added a dsc_script example flavor.
* Removed chef-gen-flavor-base as a dependency. I believe the features in chef-gen-flavor-base are unnecessary. This also removes a potential breaking change in pan for ChefDK 0.9.0.
* Added a simple helper module for less code duplication in flavors.
* Some small renames should make it easier for newer Chef developers to consume flavors or construct their own flavors by following this example.

## Release 3.0.1 2015/09/22

* Small update to take a dependency on chef-gen-flavors

## Release 3.0.0 2015/09/22

* Large refactor for chef-gen-flavors 0.9.1+. Note that this release of pan will now only work on chef-gen-flavors 0.9.1+.
* Support for ChefDK 0.7.0.

## Release 2.0.0 2015/06/03

* Massive overhaul. Now uses [chef-gen-flavors](https://rubygems.org/gems/chef-gen-flavors) and provides several different flavors of cookbook generators for you to consume.

## Release 1.1.1 2015/04/30

* Fix readme.

## Release 1.1.0 2015/04/28

* Support for ChefDK 0.5.0.
* Updates to example kitchen.yml to mirror idiomatic Windows configuration.
* Added default rubocop.yml.

## Release 1.0.1

* Small updates to support ChefDK 0.3.6. Will no longer work on ChefDK 0.3.5 and below.

## Release 1.0.0

* Provide cookbook example generator
