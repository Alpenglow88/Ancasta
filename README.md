# Ruby_API_Test_Framework

A simple RESTful api test framework using RSpec and Rake

Examples have been made using publicly open APIs for demonstration purposes and templates are given in order to allow future tests and *spec.rb files to be created

Works with ruby version >=2.6.X

## Usage

The RSpec commands are contained within Rake tasks and can be run in the following ways:

```ruby

rake test

```

to run all *_spec.rb within the `./spec` folder

```ruby

rake singleSpec[specname]

```

to run a single *_spec.rb within the /spec folder

If you need to build the tests from a new source then you must run the following

```ruby

rake build

```

you must also make sure you update the source file on line 20 of `./scripts/build.rb`

Output from these runs are all stored in the `./reports` folder and can be viewed by opening the `overview.html` document within the timestamped folder.

This folder is not committed to GitHub and there is no garbage collection on it so you will need to monitor this on your local machine so that the volume does not keep growing and cause problems.

To share the report you will need to share the whole timestamped folder (it is full of the assets the html needs).
