class FileReader
  def read(file_name: )
    @raw_file_text = File.read(File.join(File.direname(__FILE__), file_name))
  end
end