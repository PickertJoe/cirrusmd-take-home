class CSVParserAndExporter
  def initialize(reader: , parser: , writer:)
    @reader = reader
    @parser = parser
    @writer = writer
  end

  def run
    @raw_file_input = @reader.read(file_name: "../input.csv")
    @parser.parse(input: @raw_file_input)
    @writer.export(valid_data: @parser.valid_data, invalid_data: @parser.invalid_data)
  end
end