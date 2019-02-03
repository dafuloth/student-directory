File.open(File.absolute_path($0)) do |file|
  file.readlines.each do |line|
    puts line
  end
end
