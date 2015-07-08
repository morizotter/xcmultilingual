require 'erb'

module Xcmultilingual
  class Writer
    def initialize(options, multilingual)
      @verbose = options[:verbose]
      @destination = options[:destination]
      @multilingual = multilingual
    end

    def write
      puts "+ START UPDATING FILES" if @verbose

      if !File.exist?("#{@destination}")
        puts "  There is no destination file."
        return
      end

      File.open("#{@destination}", "w") do |file|
        template_file = templates_file(default_templates_dir)
        body = ERB.new(File.open(template_file).read, nil, '-').result(binding)
        file.write(body)
        puts "+ END UPDATING FILES\n\n" if @verbose
        puts "#{body}"
      end
    end

    private

    def default_templates_dir
      File.dirname(__FILE__) + '/templates'
    end

    def templates_file(dir)
      dir + "/swift.erb"
    end
  end
end
