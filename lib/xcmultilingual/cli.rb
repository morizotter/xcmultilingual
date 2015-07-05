require 'xcmultilingual'
require 'thor'
require 'set'

module Xcmultilingual
  class CLI < Thor
    class_option :verbose, :type => :boolean

    desc "update", "update xcmultilingual swift file"
    option :destination, :aliases => "-d", :required => true
    option :source, :aliases => "-s"
    def update
      puts "update #{options[:destination]}"
      multilingual = parse_lproj
      puts "multilngual: #{multilingual}"
    end

    private

    def parse_lproj

      puts "+ LOADING LOCALIZABLE FILES" if options[:verbose]

      file_paths = {}
      Dir.glob("./**/*.lproj/*.strings") do |file_path|
        filename = File.basename(file_path)
        puts "  LOAD: #{File.basename(File.dirname(file_path))}/#{File.basename(file_path)}" if options[:verbose]
        name = File.basename(file_path, ".strings")

        file_paths["#{name}"] = [] unless file_paths["#{name}"]
        file_paths["#{name}"] << file_path
      end

      multilingual = []
      file_paths.each do |name, paths|
        table = { name.to_sym => Set.new }
        paths.each do |path|
          File.readlines(path, encoding: 'UTF-8').each do |line|
            if match = line.match(/^(\".*\")\s+=\s+(\".*\")\;$/)
              table[name.to_sym] << match[1]
            end
          end
        end
        multilingual << table
      end

      multilingual
    end
  end
end
