require 'spec_helper'

describe Usda::ImportParser do
  context "parsing a valid sample FOOD_DES file" do
    before do
      @parser = Usda::ImportParser.new(File.join SPEC_SUPPORT_PATH, "FOOD_DES_sample.txt")
    end
    it "should return an array of 100 objects" do
      @parser.parse.count.should == 100
    end
  end
  context "parsing an invalid sample FOOD_DES file with inconsistent columns" do
    before do
      # the last row is missing a ^ (column separator)
      @parser = Usda::ImportParser.new(File.join SPEC_SUPPORT_PATH, "FOOD_DES_invalid_sample.txt")
    end
    it "should return an empty array" do
      @parser.parse.count.should == 0
    end
  end
end

