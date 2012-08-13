module RcrashRuby
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a RcrashRuby configuration file in config/"

      def copy_initializer
        template "rcrash_ruby.yml", "config/rcrash_ruby.yml"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end
