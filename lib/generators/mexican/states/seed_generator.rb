require 'rails/generators'
require 'csv'
require 'rainbow'

module Mexican
  # States module
  module States
    # Seed generator class
    class SeedGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../../../templates/active_record/',
                                   __FILE__)
      desc 'Seed models'
      def seed_models
        root = File.expand_path '../../../../support/', __FILE__
        Dir.glob(root + '/*.csv') do |rb_file|
          puts "#{Rainbow('Installing').red}
            #{Rainbow(rb_file.scan(/[á-óa-zA-Z]+[_[á-óa-zA-Z]+]*/)[-3]).green}"
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
                                         state_id: state.id,
                                         city_id: city.id)
        end
      end
    end
  end
end
