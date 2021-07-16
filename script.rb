Dir[File.dirname(__FILE__) + '/classes/*.rb'].each { |file| require file }

CSVParserAndExporter.new(reader: FileReader.new, parser: DataFormatter.new, writer: ReportGenerator.new).run