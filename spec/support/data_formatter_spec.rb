require_relative '../classes/data_formatter'

describe DataFormatter do
  let(:data_formatter) { DataFormatter.new }

  it "should mark rows that are missing a required field as invalid" do
    pending
  end

  it "should return dates in the proper iso8601 format" do
    pending
  end

  it "should mark rows whose dates cannot be formatted as invalid" do
    pending
  end

  it "should return phone numbers in the proper E.164 format" do
    pending
  end

  it "should mark rows whose phone numbers cannot be formatted as invalid" do
    pending
  end
end