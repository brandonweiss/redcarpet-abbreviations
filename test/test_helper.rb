$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "redcarpet-abbreviations"

require 'minitest/autorun'

class Object

  def try(*a, &b)
    if a.empty? && block_given?
      yield self
    else
      public_send(*a, &b) if respond_to?(a.first)
    end
  end

end

class String

  def strip_heredoc
    indent = scan(/^[ \t]*(?=\S)/).min.try(:size) || 0
    gsub(/^[ \t]{#{indent}}/, '')
  end

end
