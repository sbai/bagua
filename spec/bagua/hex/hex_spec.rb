# encoding: utf-8

require 'bagua'

module Bagua
  describe "Hex" do
    before(:all) do
      require 'csv'
      options = { :converters => [ :numeric ] }
      @examples = CSV.open('spec/bagua/lorem.csv', 'r', options)
    end

    it "decode(encode(str)) should equal str" do
      @examples.each do |row|
        expect(Hex.decode(Hex.encode(row[0]))).to eq row[0]
      end
    end

    it "decode(encode(str,:wen),:wen) should equal str" do
      @examples.each do |row|
        expect(Hex.decode(Hex.encode(row[0],:wen),:wen)).to eq row[0]
      end
    end

    it "decode(encode(str,:binary),:binary) should equal str" do
      @examples.each do |row|
        expect(Hex.decode(Hex.encode(row[0],:binary),:binary)).to eq row[0]
      end
    end
  end
end
