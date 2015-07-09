require 'set'

module Xcmultilingual
  class Parser
    attr_accessor :verbose

    def parse
      bundles = {}
      Dir.glob("./**/*.lproj/*.strings") do |file_path|
        # bundle
        match = file_path.match(/([^\/]*).bundle/)
        bundle_name = match ? match[1] : nil
        bundles[bundle_name] = {:file_path => file_path, :name => bundle_name, :tables => {}} unless bundles[bundle_name]
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

      return bundles.each do |k, v|
        bundle = Bundle.new(v[:file_path], v[:name], [])
        v[:tables].each do |o, p|
          table = Table.new(o, p.to_a)
          bundle.tables << table
        end
        puts bundle
      end
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
