require_relative '../classes/file_reader'

describe FileReader do
  let(:file_reader) { FileReader.new }
  let(:expected_raw_csv_data) { "first_name,last_name,dob,member_id,effective_date,expiry_date,phone_number\nJason,Bateman ,12/12/2010,AB 0000,,,\nBrent ,Wilson,1/1/1988,349090,9/30/19,9/30/2000,(303) 887 3456\nAntonio,Brown ,2/2/1966,890887,9/30/19,9/30/2000,303-333-9987\n" }

  it "should read the raw data from input.csv" do
    expect(file_reader.read(file_name: "../spec/support/test_input.csv")).to eq(expected_raw_csv_data)
  end
end