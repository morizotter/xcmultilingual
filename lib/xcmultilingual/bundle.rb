module Xcmultilingual
  Bundle = Struct.new("Bundle", :relative_path, :name, :tables) do
    def description
      name_description = name.nil? ? "MAIN BUNDLE" : name
      relative_path_description = relative_path.nil? ? "NO RELATIVE PATH" : relative_path
      tables_description = tables.map { |table| table.description }.join("")
      "  [Bundle] name: #{name_description}, relative_path: #{relative_path_description}, tables: #{tables_description}"
    end
  end

  Table = Struct.new("Table", :name, :keys) do
    def description
      keys_description = keys.join(", ")
      "\n  - [Table] name: #{name}, keys: #{keys_description}"
    end
  end
end
