require 'set'

module Xcmultilingual
  class Parser
    attr_accessor :verbose

    def initialize(destination)
      @destination = destination
    end

    def parse
      puts "+ START PARSING" if @verbose
      puts "" if @verbose

      destination_path = File.expand_path(@destination)
      destination_dir = File.dirname(destination_path)

      bundles = {}
      Dir.glob("#{destination_dir}/**/*.lproj/**/*.strings") do |file_path|
        file_path = File.expand_path(file_path)

        # bundle
        if match = file_path.match(/(?<dir>(?<name>[^\/]*).bundle)/)
          bundle_name = match["name"]
          relative_path = file_path[0, match.end("dir")]

          relative_path = create_relative_path(destination_path, relative_path)
        else
          bundle_name = nil
          relative_path = nil
        end

        bundles[bundle_name] = {:relative_path => relative_path, :name => bundle_name, :tables => {}} unless bundles[bundle_name]

        # name
        name = File.basename(file_path, ".strings")
        bundles[bundle_name][:tables][name] = Set.new  unless bundles[bundle_name][:tables].keys.include?(name)

        # keys
        File.readlines(file_path, encoding: 'UTF-8').each do |line|
          safe_line = line.scrub('?')
          if key = find_key(safe_line)
            safe_key = key.gsub(" ", "_")
            bundles[bundle_name][:tables][name] << safe_key
            puts "  PARSE: #{File.basename(file_path)} > #{line}" if @verbose
          end
        end
      end

      bundle_data = []
      bundles.each do |k, v|
        bundle = Bundle.new(v[:relative_path], v[:name], [])
        v[:tables].each do |o, p|
          table = Table.new(o, p.to_a)
          bundle.tables << table
        end

        puts "" if @verbose
        puts "#{bundle.description}" if @verbose
        bundle_data << bundle
      end

      puts "" if @verbose
      puts "+ PARSE SUCCEEDED" if @verbose
      puts "" if @verbose

      bundle_data
    end

    private

    def create_relative_path(dest_path, src_path)
      dest_split = dest_path.split("/")
      src_split = src_path.split("/")

      src_extras = []
      src_split.each_with_index do |val, idx|
        next if val == dest_split[idx]
        src_extras << val
      end

      dest_extras = []
      dest_split.each_with_index do |val, idx|
        next if val == src_split[idx]
        dest_extras << val
      end

      prefix = ""
      (dest_extras.size - 1).times do |idx|
        prefix += "../"
      end

      prefix + src_extras.join("/")
    end

    def find_key(line)
      if match = line.match(/^\"(.*)\"\s*=\s*\"(.*)\"\;$/)
        return match[1]
      end
      nil
    end
  end
end
