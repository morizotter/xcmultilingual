require 'set'

module Xcmultilingual
  class Parser
    def initialize(options)
      @verbose = options[:verbose]
    end

    def parse
      puts "+ LOADING LOCALIZABLE FILES" if @verbose

      file_paths = {}
      Dir.glob("./**/*.lproj/*.strings") do |file_path|
        filename = File.basename(file_path)
        puts "  LOAD: #{File.basename(File.dirname(file_path))}/#{File.basename(file_path)}" if @verbose
        name = File.basename(file_path, ".strings")

        file_paths["#{name}"] = [] unless file_paths["#{name}"]
        file_paths["#{name}"] << file_path
      end

      multilingual = []
      file_paths.each do |name, paths|
        set = Set.new
        paths.each do |path|
          File.readlines(path, encoding: 'UTF-8').each do |line|
            if key = find_key(line)
              set << key
            end
          end
        end

        multilingual << Table.new(name, set.to_a)
      end
      multilingual
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
