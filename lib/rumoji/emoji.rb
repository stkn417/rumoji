# -*- encoding: utf-8 -*-
module Rumoji
  class Emoji

    attr_reader :name, :string

    def initialize(string, symbols, name = nil)
      @string = string
      @codepoints = string.codepoints
      @cheat_codes = [symbols].flatten
      @name = name || @cheat_codes.first.to_s.upcase.gsub("_", " ")
    end

    def symbol
      @cheat_codes.first
    end

    def code
      ":#{symbol}:"
    end

    def include?(symbol)
      @cheat_codes.include? symbol.to_sym
    end

    def to_s
      @string
    end

    def hash
      code.hash
    end

    def hex
      @hex ||= @codepoints.map{|point| point.to_s(16).upcase }.join("-")
    end

    def codepoints
      @codepoints.entries
    end

    def multiple?
      codepoints.size > 1
    end

    autoload :PEOPLE, 'rumoji/emoji/people'
    autoload :NATURE, 'rumoji/emoji/nature'
    autoload :OBJECTS, 'rumoji/emoji/objects'
    autoload :PLACES, 'rumoji/emoji/places'
    autoload :SYMBOLS, 'rumoji/emoji/symbols'
    autoload :MODIFIERS, 'rumoji/emoji/modifiers'

    ALL = PEOPLE | NATURE | OBJECTS | PLACES | SYMBOLS | MODIFIERS

    ALL_REGEXP = Regexp.new(ALL.map(&:string).join('|'))

    def self.find(symbol)
      ALL.find {|emoji| emoji.include? symbol }
    end

    STRING_LOOKUP = ALL.each.with_object({}) do |emoji, lookup|
      lookup[emoji.string] = emoji
    end

    def self.find_by_string(string)
      STRING_LOOKUP[string]
    end
  end
end
