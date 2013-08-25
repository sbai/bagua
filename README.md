# Bagua

**Bagua** is a gem that encodes text as strings of [_trigrams_](http://en.wikipedia.org/wiki/Bagua) or [_hexagrams_](http://en.wikipedia.org/wiki/List_of_hexagrams_of_the_I_Ching).

Trigrams and hexagrams are symbols used in Taoist cosmology, e.g. in the [I Ching](http://en.wikipedia.org/wiki/I_Ching). A trigram consists of three parallel horizontal lines, each of which can be either broken or unbroken. Because each line can be in one of 2 states, and there are 3 lines in total, there are a total of 2^3 = 8 possible combinations, as shown below.

☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷

Each trigram above can be interpreted as a 3-bit binary sequence, where ☰ is 000 and ☷ is 111. Similarly, a hexagram can be interpreted as a 6-bit binary sequence, as it consists of six lines, or two trigrams put together. Consequently, as [noted by Leibniz](http://en.wikipedia.org/wiki/Gottfried_Wilhelm_Leibniz#Sinophile), sequences of trigrams or hexagrams can be used to represent arbitrary binary data.

Because a plain text string is just a representation of an array of numbers, it follows that any string can be encoded as a sequence of trigrams or hexagrams. These trigrams and hexagrams themselves are also just plain text (Unicode) characters.

## Usage

```ruby
require 'bagua'
```

### Encoding


```ruby
# trigrams
Bagua::Tri.encode("abcde") # => "☳☰☲☶☱☱☴☳☳☱☰☶☲☴"
```

Historically, hexagrams have been listed in several different sequences. **Bagua** can encode hexagrams using either the default binary sequence ([Fu Xi](http://en.wikipedia.org/wiki/Fu_Xi)'s sequence) or the [King Wen sequence](http://en.wikipedia.org/wiki/King_Wen_sequence).

```ruby
# hexagrams in binary sequence
Bagua::Hex.encode("abcde", :binary) # => "䷘䷕䷹䷟䷐䷙䷤"
```


```ruby
# same as above but shorter
Bagua::Hex.encode("abcde") # => "䷘䷕䷹䷟䷐䷙䷤"
```


```ruby
# King Wen sequence
Bagua::Hex.encode("abcde", :wen) # => "䷘䷖䷉䷣䷙䷆䷔"
```


### Decoding

```ruby
# trigrams
Bagua::Tri.decode("☳☰☲☶☱☱☴☳☳☱☰☶☲☴") # => "abcde"
```

```ruby
# hexagrams in binary sequence
Bagua::Hex.decode("䷘䷕䷹䷟䷐䷙䷤", :binary) # => "abcde"
```


```ruby
# same as above but shorter
Bagua::Hex.decode("䷘䷕䷹䷟䷐䷙䷤") # => "abcde"
```


```ruby
# King Wen sequence
Bagua::Hex.decode("䷘䷖䷉䷣䷙䷆䷔", :wen) # => "abcde"
```
