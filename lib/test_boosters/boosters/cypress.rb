module TestBoosters
  module Boosters
    class Cypress < Base

      def initialize
        super(file_pattern, exclude_pattern, split_configuration_path, command)
      end
      
      def command
        @command ||= "npx cypress run #{cypress_options} --spec"
      end

      def split_configuration_path
        ENV["CYPRESS_SPLIT_CONFIGURATION_PATH"] || "#{ENV["HOME"]}/cypress_split_configuration.json"
      end
      
      def cypress_options
        @cypress_options ||= "#{ENV["TEST_BOOSTERS_CYPRESS_OPTIONS"]}"
      end
      
      def file_pattern
        ENV["TEST_BOOSTERS_CYPRESS_TEST_FILE_PATTERN"] || "cypress/**/*_spec.js"
      end

      def exclude_pattern
        ENV["TEST_BOOSTERS_CYPRESS_TEST_EXCLUDE_PATTERN"]
      end

    end
  end
end
