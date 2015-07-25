require 'set'

module Xcmultilingual
  class Parser
    attr_accessor :verbose

    def initialize(destination)
      @destination = destination
    end

    def parse
      puts "[START PARSING]" if @verbose

      destination_path = File.expand_path(@destination)
      destination_dir = File.dirname(destination_path)

      bundles = {}
      Dir.glob("#{destination_dir}/**/*.lproj/**/*.strings") do |file_path|
        file_path = File.expand_path(file_path)

        # bundle
        if match = file_path.match(/(?<dir>(?<name>[^\/]*).bundle)/)
          bundle_name = match["name"]
        else
          bundle_name = nil
        end

        bundles[bundle_name] = {:name => bundle_name, :tables => {}} unless bundles[bundle_name]

        # name
        name = File.basename(file_path, ".strings")
        bundles[bundle_name][:tables][name] = Set.new  unless bundles[bundle_name][:tables].keys.include?(name)

        # keys
        File.readlines(file_path, encoding: 'UTF-8').each do |line|
          safe_line = line.scrub('?')
          if key = find_key(safe_line)
            bundles[bundle_name][:tables][name] << key
            puts "<#{File.basename(file_path)}> #{line}" if @verbose
          end
        end
      end

      bundle_data = []
      bundles.each do |k, v|
        bundle = Bundle.new(v[:name], [])
        v[:tables].each do |o, p|
          table = Table.new(o, p.to_a)
          bundle.tables << table
        end

        puts "#{bundle.description}" if @verbose
        bundle_data << bundle
      end

      puts "[PARSE SUCCEEDED]" if @verbose
      puts "" if @verbose

      bundle_data
    end

    private

    def find_key(line)
      if match = line.match(/^\"(.*)\"\s*=\s*\"(.*)\"\;$/)
        return match[1]
      end
      nil
    end
  end
end
