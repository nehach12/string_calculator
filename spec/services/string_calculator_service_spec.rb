require 'rails_helper'

RSpec.describe StringCalculatorService do
  describe ".add" do
    context "when the input is empty" do
      it "returns 0" do
        expect(StringCalculatorService.add("")).to eq(0)
      end
    end

    context "when the input is a 0" do
      it "returns 0" do
        expect(StringCalculatorService.add("0")).to eq(0)
      end
    end

    context "when the input is a single number" do
      it "returns the number" do
        expect(StringCalculatorService.add("1")).to eq(1)
      end
    end

    context "when the input is multiple numbers separated by commas" do
      it "returns the sum of the numbers" do
        expect(StringCalculatorService.add("1,5")).to eq(6)
      end
    end

    context "when the input contains newlines and commas" do
      it "returns the sum of the numbers" do
        expect(StringCalculatorService.add("1\n2,3")).to eq(6)
      end
    end

    context "when the input ends with a comma" do
      it "raises an error" do
        expect { StringCalculatorService.add("1,\n") }.to raise_error(RuntimeError, "invalid input")
      end
    end

    context "when the input contains negative numbers" do
      it "raises an error with the negative numbers" do
        expect { StringCalculatorService.add("-1,2,-3") }.to raise_error(RuntimeError, "negative numbers not allowed: -1, -3")
      end
    end
  end
end