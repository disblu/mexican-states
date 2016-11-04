# Mexican::States

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mexican-states'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mexican-states

## Usage

Next, you need to run the generator:

```ruby
rails g mexican:states:install
```

This command will create 3 models (State, City and Neighborhood).

To populate the database run the next command: (it's going to populate the database with the data of each state, city and neighborhood of Mexico.)

```ruby
rails g mexican:states:seed
```

If you want to select just some states, you can just pass the name of the states as arguments.

```ruby
rails g mexican:states:seed Aguascalientes Baja_California_Sur
```


Full list of available states
```
Aguascalientes
Baja_California
Baja_California_Sur
Campeche
Chiapas
Chihuahua
Coahuila_de_Zaragoza
Colima
Installing Colima
Distrito_Federal
Durango
Installing Durango
Guanajuato
Guerrero
Hidalgo
Jalisco
México
Michoacán_de_Ocampo
Morelos
Nayarit
Nuevo_León
Oaxaca
Puebla
Querétaro
Quintana_Roo
San_Luis_Potosí
Sinaloa
Sonora
Tabasco
Tamaulipas
Tlaxcala
Veracruz_de_Ignacio_de_la_Llave
Yucatán
Zacatecas
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/disblu/mexican-states. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

