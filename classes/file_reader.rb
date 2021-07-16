class FileReader
  def read(file_name: )
    @raw_file_text = File.read(File.join(File.dirname(__FILE__), file_name))
  end
end