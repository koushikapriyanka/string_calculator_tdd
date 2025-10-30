require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calc) { StringCalculator.new }

  describe "#add" do
    it "returns 0 for an empty string" do
      expect(calc.add("")).to eq(0)
    end

    it "returns number itself for single number" do
      expect(calc.add("1")).to eq(1)
    end
      
    it "returns sum of two comma-separated numbers" do
      expect(calc.add("1,5")).to eq(6)
    end   
    
    it "returns sum for multiple numbers" do
      expect(calc.add("1,2,3,4")).to eq(10)
    end     
    
    it "handles newlines as delimiters" do
      expect(calc.add("1\n2,3")).to eq(6)
    end     
    
    it "supports custom delimiter" do
      expect(calc.add("//;\n1;2")).to eq(3)
    end  
    
    it "raises error for negative numbers" do
      expect { calc.add("1,-2,3") }.to raise_error("negative numbers not allowed -2")
    end     
    
    it "lists all negative numbers in error" do
      expect { calc.add("-1,-2,3") }.to raise_error("negative numbers not allowed -1,-2")
    end      
  end
end
