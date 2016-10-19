require 'rails/generators'
require 'rails/generators/migration'
require 'csv'

module Mexican
  # States module
  module States
    # Install generator class
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../../../templates/active_record/',
                                   __FILE__)

      def self.next_migration_number(path)
        next_migration_number = current_migration_number(path) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      desc 'Copy base migrations'
      def copy_migrations
        migration_template '../migrations/create_states.rb',
                           'db/migrate/create_states.rb'
        migration_template '../migrations/create_cities.rb',
                           'db/migrate/create_cities.rb'
        migration_template '../migrations/create_neighborhoods.rb',
                           'db/migrate/create_neighborhoods.rb'
        rake 'db:migrate'
      end

      desc 'Copy base models'
      def copy_models
        copy_file './models/state.rb', 'app/models/state.rb'
        copy_file './models/city.rb', 'app/models/city.rb'
        copy_file './models/neighborhood.rb', 'app/models/neighborhood.rb'
      end

      desc 'Seed models'
      def seed_models
        root = File.expand_path '../../../../support/', __FILE__
        Dir.glob(root + '/*.csv') do |rb_file|
          save_datum(File.join(rb_file))
        end
      end

      private

      def save_datum(file)
        CSV.foreach(file) do |row|
          city_name = row[2]
          neighborhood_name = row[1]
          neighborhood_zip_code = row[0]
          state = State.find_or_create_by(name: row[3])
          city = City.find_or_create_by(name: city_name, state_id: state.id)
          Neighborhood.find_or_create_by(name: neighborhood_name,
                                         zip_code: neighborhood_zip_code,
                                         city_id: city.id)
        end
      end
    end
  end
end
