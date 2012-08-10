module RcrashRuby
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a RcrashRuby initializer in config/initializers/"

      def copy_initializer
        template "rcrash_ruby.rb", "config/initializers/rcrash_ruby.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end
    end
  end
end