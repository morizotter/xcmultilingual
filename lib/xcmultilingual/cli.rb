require 'xcmultilingual'
require 'thor'
require 'pathname'

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
      hash = {}
      Dir.glob("./**/*.lproj") do |path|
        lproj = File.basename(path)
        puts "Load: #{lproj}" if options[:verbose]
        lang = File.basename(lproj, ".lproj")

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
    end
  end
end
