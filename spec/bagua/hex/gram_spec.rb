# encoding: utf-8

require 'bagua'

module Bagua
  describe "Hex" do
    describe "::gram" do
      before(:all) do
        require 'csv'
        options = { :converters => [ :numeric ] }
        @examples = CSV.open('spec/bagua/hex/gram.csv', 'r', options)
      end

      it "works for all example valid inputs" do
        @examples.each do |row|
          Hex.gram(row[0]).should == row[1]
        end
      end
    end

    describe "::gram_bin" do
      before(:all) do
        require 'csv'
        options = { :converters => [ :numeric ] }
        @examples = CSV.open('spec/bagua/hex/gram_bin.csv', 'r', options)
      end

      it "works for all example valid inputs" do
        @examples.each do |row|
          Hex.gram_bin(row[0]).should == row[1]
        end
      end
    end
  end
end
