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

  it "returns phone numbers unaltered if they're already in the proper format" do
    raw_phone_number = "+18168636068"
    formatted_phone_number = data_formatter.format_as_E164(phone_number: raw_phone_number)
    expect(formatted_phone_number).to eq(raw_phone_number)
  end

  it "E.164 regex returns the expected format" do
    number_without_country_code = "8168636068"
    formatted_phone_number = data_formatter.format_as_E164(phone_number: number_without_country_code)
    expect(formatted_phone_number).to eq("+18168636068")
  end

  it "properly parse a 10 digit phone number" do
    number_without_country_code = "8168636068"
    formatted_phone_number = data_formatter.format_as_E164(phone_number: number_without_country_code)
    expect(formatted_phone_number).to eq("+18168636068")
  end

  it "properly parse an 11 digit phone number if the leading digit is 1" do
    number_without_country_code = "18168636068"
    formatted_phone_number = data_formatter.format_as_E164(phone_number: number_without_country_code)
    expect(formatted_phone_number).to eq("+18168636068")
  end

  it "remove all hyphens from a phone number string" do
    raw_phone_number = "816-863-6068"
    formatted_phone_number = data_formatter.format_as_E164(phone_number: raw_phone_number)
    expect(formatted_phone_number).to eq("+18168636068")
  end

  it "remove all parentheses and internal spaces from a phone number string" do
    raw_phone_number = "(816) 863 6068"
    formatted_phone_number = data_formatter.format_as_E164(phone_number: raw_phone_number)
    expect(formatted_phone_number).to eq("+18168636068")
  end

  it "should return phone numbers in the proper E.164 format" do
    data_formatter.parse(input: formatter_input)
    expect(data_formatter.valid_data.map{ |row| row[:phone_number] }).to all(match(/^\+1\d{10}$/))
  end

  it "should mark rows whose phone numbers cannot be formatted as invalid" do
    data_formatter.parse(input: formatter_input)
    expect(data_formatter.invalid_data.length).to eq(1)
  end
end