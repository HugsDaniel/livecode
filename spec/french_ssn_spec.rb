require_relative '../french_ssn'

describe "#french_ssn_message" do
  it "returns invalid message when no SSN is given" do
    expected  = "The number is invalid"
    actual    = french_ssn_message("")

    expect(actual).to eq(expected)
  end

  it "returns invalid message for invalid key" do
    expected  = "The number is invalid"
    actual    = french_ssn_message("1 84 12 76 451 089 47")

    expect(actual).to eq(expected)
  end

  it "returns the correct message for a valid SSN" do
    expected  = "a man, born in December, 1984 in Seine-Maritime."
    actual    = french_ssn_message("1 84 12 76 451 089 46")

    expect(actual).to eq(expected)
  end
end
