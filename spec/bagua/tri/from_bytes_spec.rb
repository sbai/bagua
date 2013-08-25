# encoding: utf-8

require 'bagua'

module Bagua
  describe "Tri" do
    describe "::from_bytes" do
      before(:all) do
        require 'csv'
        options = { :converters => [ :numeric ] }
        @examples = CSV.open('spec/bagua/tri/from_bytes.csv', 'r', options)
      end

      it "works for all example valid inputs" do
        @examples.each do |row|
          Tri.from_bytes(row[0..-2]).should == row[-1]
        end
      end
    end
  end
end
