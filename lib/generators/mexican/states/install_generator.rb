require 'rails/generators'

module Mexican
  module States
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path('../../../templates/active_record/models', __FILE__)
      desc "Create state model migration"


      def copy_migrations
        migration_template "create_double_double.rb",
          "db/migrate/create_double_double.rb"
      end

      def copy_models
        copy_file "state.rb", "app/models/state.rb"
        copy_file "city.rb", "app/models/city.rb"
        copy_file "neighborhood.rb", "app/models/neighborhood.rb"
        rake "db:migrate"
      end
    end
  end
end

