require 'rails/generators'
require 'rails/generators/migration'

module Mexican
  module States
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../../../templates/active_record/', __FILE__)


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
        rake "db:migrate"
      end

      desc 'Copy base models'
      def copy_models
        copy_file './models/state.rb', 'app/models/state.rb'
        copy_file './models/city.rb', 'app/models/city.rb'
        copy_file './models/neighborhood.rb', 'app/models/neighborhood.rb'
      end
    end
  end
end
