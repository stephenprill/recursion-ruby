def file_sizes(pattern)
  size = 0

  Dir.glob(pattern) do |path|
    if File.directory?(path)
      size += file_sizes(path + "/*")
    else
      size += File.size(path)
    end
  end
  size
end

p file_sizes("*")
