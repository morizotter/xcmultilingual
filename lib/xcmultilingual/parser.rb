require 'set'

module Xcmultilingual
  class Parser
    attr_accessor :verbose

    def parse
      bundles = {}
      puts "+ START PARSING" if @verbose
      Dir.glob("./**/*.lproj/**/*.strings") do |file_path|
        # bundle
        if match = file_path.match(/(?<dir>(?<name>[^\/]*).bundle)/)
          bundle_name = match["name"]
          bundle_path = file_path[0, match.end("dir")]
        else
          bundle_name = nil
          bundle_path = nil
        end
        bundles[bundle_name] = {:file_path => bundle_path, :name => bundle_name, :tables => {}} unless bundles[bundle_name]
        # file_pathをbundle_pathに修正する

        # name
        name = File.basename(file_path, ".strings")
        bundles[bundle_name][:tables][name] = Set.new  unless bundles[bundle_name][:tables].keys.include?(name)

        # keys
        File.readlines(file_path, encoding: 'UTF-8').each do |line|
          if key = find_key(line)
            bundles[bundle_name][:tables][name] << key
          end
        end
      end

      bundle_data = []
      bundles.each do |k, v|
        bundle = Bundle.new(v[:file_path], v[:name], [])
        v[:tables].each do |o, p|
          table = Table.new(o, p.to_a)
          bundle.tables << table
        end
        bundle_data << bundle
      end
      puts "  BUNDLE DATA" if @verbose
      puts "  #{bundle_data[0]}" if @verbose
      puts "+ PARSE SUCCEEDED." if @verbose
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
