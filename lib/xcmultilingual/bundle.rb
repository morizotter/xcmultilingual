module Xcmultilingual
  Bundle = Struct.new("Bundle", :name, :tables) do
    def description
      name_description = name.nil? ? "MAIN BUNDLE" : name
      tables_description = tables.map { |table| table.description }.join(" / ")
      "[#{name_description}]\nname: #{name_description}, tables: #{tables_description}"
    end
  end

  Table = Struct.new("Table", :name, :keys) do
    def description
      keys_description = keys.join(", ")
      "[Table] name: #{name}, keys: #{keys_description}"
    end
  end
end

class String
  def safe
    return self.gsub(" ", "_")
  end
end
