require_relative '../classes/data_formatter'

describe DataFormatter do
  let(:data_formatter) { DataFormatter.new }
  let(:formatter_input) { File.read(File.join(File.dirname(__FILE__), './support/test_input.csv')) }

  it "should mark rows that are missing a required field as invalid" do
    data_formatter.parse(input: formatter_input)
    expect(data_formatter.invalid_data.length).to eq 1
  end

  it "should return dates in the proper iso8601 format" do
    data_formatter.parse(input: formatter_input)
    expect(data_formatter.valid_data.map{ |row| row[:dob] }).to all(match(/\d{4}-\d{2}-\d{2}/))
    expect(data_formatter.valid_data.map{ |row| row[:effective_date] }).to all(match(/\d{4}-\d{2}-\d{2}/))
    expect(data_formatter.valid_data.map{ |row| row[:expiry_date] }).to all(match(/\d{4}-\d{2}-\d{2}/))
  end

  xit "should return phone numbers in the proper E.164 format" do
    pending "To do"
  end

  xit "should mark rows whose phone numbers cannot be formatted as invalid" do
    pending "To do"
  end
end