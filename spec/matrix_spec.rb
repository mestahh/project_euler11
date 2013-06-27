require 'support/spec_helper'

describe Matrix do
  before :each do
    @matrix = Matrix.new
    @matrix.load
  end
  
  it "loads the matrix.txt file in" do
    @matrix.get(1,1).should eq(8)
    @matrix.get(1,2).should eq(49)
    @matrix.get(2,1).should eq(2)
  end
  
  it "parses a string line of numbers to an int array" do
    result = @matrix.line_as_array('08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08')
    result[0].should eq(8)
    result[18].should eq(91)
  end
  
  it "calculates the adjacent value southeast" do
    @matrix.calculate_adjacent_south_east(7, 9).should eq(1788696)
  end
  
  it "calculates the adjacent value northwest" do
    @matrix.calculate_adjacent_north_west(10, 12).should eq(1788696)
  end
end
