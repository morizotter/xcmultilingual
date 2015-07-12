module Xcmultilingual
  Bundle = Struct.new("Bundle", :relative_path, :name, :tables) do

  end

  Table = Struct.new("Table", :name, :keys) do

  end
end
