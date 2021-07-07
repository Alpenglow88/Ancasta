# Ruby_API_Test_Framework - WIP

A simple RESTful api test framework using RSpec and Rake

Examples have been made using publicly open APIs for demonstration purposes and templates are given in order to allow future tests and *spec.rb files to be created

Works with ruby version >=2.6.X


## Usage:
The RSpec commands are contained witin Rake tasks and can be run in the following ways:

```ruby

rake test

```

to run all *_spec.rb within the /spec folder




```ruby

rake singleSpec[specname]

```

to run a single *_spec.rb within the /spec folder
