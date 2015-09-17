# -*- encoding: utf-8 -*-

require 'rumoji/emoji'
require 'set'

# Reference http://emojipedia.org/modifiers/

module Rumoji
  class Emoji
    MODIFIERS = Set[
      self.new("\u{1F3FB}", [:emoji_modifier_fitzpatrick_type_1_2]),
      self.new("\u{1F3FC}", [:emoji_modifier_fitzpatrick_type_3]),
      self.new("\u{1F3FD}", [:emoji_modifier_fitzpatrick_type_4]),
      self.new("\u{1F3FE}", [:emoji_modifier_fitzpatrick_type_5]),
      self.new("\u{1F3FF}", [:emoji_modifier_fitzpatrick_type_6]),
    ]
  end
end
