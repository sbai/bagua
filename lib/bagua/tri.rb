module Bagua
  # Provides encoding and decoding functions for trigrams.
  class Tri
    # Encodes a string into a string of trigrams representing the byte values
    # of each character in the string.
    def self.encode(str)
      return from_bytes(str.unpack('C*'))
    end

    # Decodes a string of trigrams into a UTF-8 string.
    # @note Chomps trailing null characters, as they are the result of zero
    #   padding added when the number of bits being encoded in the trigrams
    #   is not an even multiple of 3.
    # @todo Add an option to choose the encoding.
    def self.decode(grams)
      return to_bytes(grams).pack('C*').chomp("\000").force_encoding('utf-8')
    end

    # Returns the trigram representation of the input bytes.
    def self.from_bytes(bytes)
      trios = Bagua::bytes_to_ntets(bytes, 3)
      grams = trios.map { |trio| gram(trio) }
      return grams.join("")
    end

    # Returns the byte representation of a string of trigrams.
    def self.to_bytes(grams)
      ucodes = grams.unpack('U*')
      trios = ucodes.map { |ucode| ucode - TRI_BASE }
      bytes = Bagua::ntets_to_bytes(trios, 3)
      return bytes
    end

    private

    # Decimal representation of the Unicode code point of the first trigram
    # character. The code point for any trigram can by obtained by adding an
    # offset between 0 and 7 to TRI_BASE.
    TRI_BASE = 9776

    # Returns the trigram representation of num.
    # If num >= 8, only the lowest three bits are used.
    # @note The trigrams are arranged in binary order, as they are arranged in
    #   Unicode.
    def self.gram(num)
      return [TRI_BASE + (num & 7)].pack('U')
    end
  end
end
