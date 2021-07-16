require "csv"

class ReportGenerator
  def export(valid_data: , invalid_data: )
    write_to_csv(valid_data: valid_data)
    write_to_txt(invalid_data: invalid_data)
  end

  def write_to_csv(valid_data: )
    CSV.open("output.csv", "w", { headers: valid_data.first.keys }) do |csv|
      valid_data.each do |row_hash|
        csv << row_hash.values
      end
    end
  end

  def write_to_txt(invalid_data: )
    report_file = File.open("report.txt", "w")
    report_file.write("The following #{invalid_data.length} records could not be formatted: \n")
    invalid_data.each do |invalid_record|
      report_file.write(invalid_record.values.join(", "))
    end
    report_file.close
  end
end