# encoding: utf-8

require 'bagua'

module Bagua
  describe "Tri" do
    before(:all) do
      require 'csv'
      options = { :converters => [ :numeric ] }
      @examples = CSV.open('spec/bagua/lorem.csv', 'r', options)
    end

    it "decode(encode(str)) should equal str" do
      @examples.each do |row|
        expect(Tri.decode(Tri.encode(row[0]))).to eq row[0]
      end
    end
  end
end
