require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DottableHash" do
	before :each do
		@dottable_hash = {:foo => "bar", "baz" => :boo, :blah => {"blah" => "blah"}}.dottable!
	end

  it "should allow one to use a key as a method call" do
		@dottable_hash.foo.should == "bar"
  end

	it "should recursively extend the hash" do
		@dottable_hash.blah.blah.should == "blah"
	end
end
