# encoding: utf-8

require 'bagua'

module Bagua
  describe "Tri" do
    describe "::gram" do
      before(:all) do
        require 'csv'
        options = { :converters => [ :numeric ] }
        @examples = CSV.open('spec/bagua/tri/gram.csv', 'r', options)
      end

      it "works for all example valid inputs" do
        @examples.each do |row|
          expect(Tri.gram(row[0])).to eq row[1]
        end
      end
    end
  end
end
