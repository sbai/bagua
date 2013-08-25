# encoding: utf-8
require_relative 'bagua/version'
require_relative 'bagua/hex'
require_relative 'bagua/tri'

# Provides encoding and decoding functions for trigrams and hexagrams.
module Bagua
  # Converts an array of bytes (integers representable in 8 bits) to an array
  # of ntets (integers representable in n bits).
  def self.bytes_to_ntets(bytes, n)
    countn = 0
    current = 0
    ntets = []
    bytes.each do |byte|
      7.downto(0) do |b|
        bit = (byte >> b) & 1
        current = (current << 1) | bit
        countn = (countn + 1) % n
        if (countn == 0)
          ntets.push(current)
          current = 0
        end
      end
    end

    # handle leftover bits when n doesn't divide evenly into bytes.length*8
    if (countn > 0)
      current = current << (n - countn)
      ntets.push(current)
    end

    return ntets
  end

  # Converts an array of ntets (integers representable in n bits) to an array
  # of bytes (integers representable in 8 bits).
  def self.ntets_to_bytes(ntets, n)
    count8 = 0
    current = 0
    bytes = []
    ntets.each do |ntet|
      (n - 1).downto(0) do |b|
        bit = (ntet >> b) & 1
        current = (current << 1) | bit
        count8 = (count8 + 1) % 8
        if (count8 == 0)
          bytes.push(current)
          current = 0
        end
      end
    end

    # handle leftover bits when 8 doesn't divide evenly into ntets.length*n
    if (count8 > 0)
      current = current << (8 - count8)
      bytes.push(current)
    end

    return bytes
  end
end
