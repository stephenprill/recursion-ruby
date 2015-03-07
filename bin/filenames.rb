

  def file_names(pattern, level=0)

    Dir.glob(pattern) do |path|
      puts "#{" " * level * 2}#{File.basename(path)}"
      file_names(path + '/*', level + 1) if File.directory?(path)
    end
  end



  puts file_names('*')
