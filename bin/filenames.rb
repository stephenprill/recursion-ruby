def filenames(pattern, level = 0)
  Dir.glob(pattern) do |path|
    puts "#{" " * level * 2}#{File.basename(path)}"
    filenames(path + '/*', level + 1) if File.directory?(path)
  end
end

filenames("*")
