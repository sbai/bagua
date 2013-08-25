module Bagua
  # Provides encoding and decoding functions for hexagrams.
  class Hex
    # Encodes a string into a string of hexagrams representing the byte values
    # of each character in the string.
    def self.encode(str, sequence = :binary)
      return from_bytes(str.unpack('C*'), sequence)
    end

    # Decodes a string of hexagrams into a UTF-8 string.
    # @note Chomps trailing null characters, as they are the result of zero
    #   padding added when the number of bits being encoded in the hexagrams
    #   is not an even multiple of 6.
    def self.decode(grams, sequence = :binary)
      return to_bytes(grams, sequence).pack('C*').chomp("\000").force_encoding('utf-8')
    end

    # Returns the hexagram representation of the input bytes.
    def self.from_bytes(bytes, sequence = :binary)
      sextets = Bagua::bytes_to_ntets(bytes, 6)

      if (sequence == :wen)
        return sextets.map { |sextet| gram(sextet) }.join("")
      elsif (sequence == :binary)
        return sextets.map { |sextet| gram_bin(sextet) }.join("")
      else
        raise "invalid sequence type"
      end
    end

    # Returns the byte representation of a string of hexagrams.
    def self.to_bytes(grams, sequence = :binary)
      ucodes = grams.unpack('U*')

      sextets = ucodes.map { |ucode| ucode - HEX_BASE }

      if (sequence == :wen)
      elsif (sequence == :binary)
        wen_to_bin = BIN_TO_WEN.invert()
        sextets.map! { |sextet| wen_to_bin[sextet]}
      else
        raise "invalid sequence type"
      end
      
      bytes = Bagua::ntets_to_bytes(sextets, 6)
      return bytes
    end

    private

    # Decimal representation of the Unicode code point of the first hexagram
    # character. The code point for any hexagram can by obtained by adding an
    # offset between 0 and 63 to HEX_BASE.
    HEX_BASE = 19904

    # Binary sequence mapping for hexagram characters. This is needed because
    # the hexagram characters are ordered by King Wen's sequence in Unicode.
    BIN_TO_WEN = {
      0 => 0,
      1 => 42,
      2 => 13,
      3 => 33,
      4 => 8,
      5 => 4,
      6 => 25,
      7 => 10,
      8 => 9,
      9 => 57,
      10 => 37,
      11 => 53,
      12 => 60,
      13 => 59,
      14 => 40,
      15 => 18,
      16 => 12,
      17 => 48,
      18 => 29,
      19 => 54,
      20 => 36,
      21 => 62,
      22 => 21,
      23 => 35,
      24 => 24,
      25 => 16,
      26 => 20,
      27 => 50,
      28 => 41,
      29 => 2,
      30 => 26,
      31 => 23,
      32 => 43,
      33 => 27,
      34 => 49,
      35 => 31,
      36 => 56,
      37 => 47,
      38 => 17,
      39 => 45,
      40 => 5,
      41 => 46,
      42 => 63,
      43 => 39,
      44 => 58,
      45 => 28,
      46 => 3,
      47 => 6,
      48 => 32,
      49 => 30,
      50 => 55,
      51 => 61,
      52 => 52,
      53 => 38,
      54 => 51,
      55 => 14,
      56 => 11,
      57 => 44,
      58 => 34,
      59 => 15,
      60 => 19,
      61 => 7,
      62 => 22,
      63 => 1
    }

    # Returns the hexagram in King Wen's sequence that corresponds to the
    # number num.
    # @note If num >= 64, only the lowest six bits are used.
    def self.gram(num)
      return [HEX_BASE + (num & 63)].pack('U')
    end

    # Returns the hexagram in binary sequence that corresponds to the number
    # num.
    # @note If num >= 64, only the lowest six bits are used.
    def self.gram_bin(num)
      return gram(BIN_TO_WEN[num & 63])
    end
  end
end
