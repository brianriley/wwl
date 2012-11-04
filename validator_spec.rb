require_relative "validator"


describe Validator do
  it "rejects spaces" do
    validator = Validator.new
    expect { validator.clean("abc def") }.to raise_error(ValidationError)
  end

  it "rejects digits" do
    validator = Validator.new
    expect { validator.clean("123") }.to raise_error(ValidationError)
  end

  it "rejects quotes" do
    validator = Validator.new
    expect { validator.clean("'") }.to raise_error(ValidationError)
  end

  it "allows string of alphabetical chars" do
    validator = Validator.new
    validator.clean("abc").should == "abc"
  end

  it "lowercases uppercased letters" do
    validator = Validator.new
    validator.clean("ABC").should == "abc"
  end
end
