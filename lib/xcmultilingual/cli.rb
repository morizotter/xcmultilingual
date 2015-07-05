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
      parse_lproj
    end

    private

    def parse_lproj
      file_paths = {}
      Dir.glob("./**/*.lproj") do |dir_path|
        Dir.glob("#{dir_path}/*.strings") do |file_path|
          filename = File.basename(file_path)
          puts "LOAD: #{File.basename(dir_path)}/#{File.basename(file_path)}"

          file_paths["#{filename}"] = [] unless file_paths["#{filename}"]
          file_paths["#{filename}"] << file_path
        end

        # filename = File.basename(path)
        # puts "Load: #{filename}" if options[:verbose]


        # File.readlines(path, encoding: 'UTF-8').each_with_index do |line, index|
        #   # puts index
        #   # puts line
        # end

        # puts "Language: #{lang}" if options[:verbose]

        # filename = File.basename(storyboard, '.storyboard')
        # storyboards << filename
        #
        # constants[filename] << Location.new('storyboardNames', nil, storyboard, filename, storyboard_index + 1)
        #
        #
        # File.readlines(storyboard, encoding: 'UTF-8').each_with_index do |line, index|
        #   options.queries.each do |query|
        #     next unless value = line[query.regex, 1]
        #     next if value.strip.empty?
        #     next unless value.start_with?(options.prefix) if options.prefix
        #
        #     constants[value] << Location.new(query.node, query.attribute, line.strip, filename, index + 1)
        #   end
        # end
      end
      p file_paths
    end
  end
end
