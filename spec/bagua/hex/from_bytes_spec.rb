# encoding: utf-8

require 'bagua'

module Bagua
  describe "Hex" do
    describe "::from_bytes" do
      before(:all) do
        require 'csv'
        options = { :converters => [ :numeric ] }
        @examples_wen = CSV.open('spec/bagua/hex/from_bytes.csv', 'r', options)
        @examples_bin = CSV.open('spec/bagua/hex/from_bytes_bin.csv', 'r', options)
      end

      it "works for all King Wen sequence examples" do
        @examples_wen.each do |row|
          expect(Hex.from_bytes(row[0..-2],:wen)).to eq row[-1]
        end
      end

      it "works for all binary sequence examples" do
        @examples_bin.each do |row|
          expect(Hex.from_bytes(row[0..-2],:binary)).to eq row[-1]
        end
      end
    end
  end
end
