require File.expand_path("../../../test_helper", __FILE__)

describe Redcarpet::Render::HTMLAbbreviations do

  before do
    @renderer = Class.new do
      include Redcarpet::Render::HTMLAbbreviations
    end
  end

  describe "#preprocess" do

    it "converts markdown abbrevations to HTML" do
      markdown = <<-EOS.strip_heredoc
        YOLO

        *[YOLO]: You Only Live Once
      EOS

      @renderer.new.preprocess(markdown).must_equal <<-EOS.strip_heredoc.chomp
        <abbr title="You Only Live Once">YOLO</abbr>
      EOS
    end

    it "converts hyphenated abbrevations to HTML" do
      markdown = <<-EOS.strip_heredoc
        JSON-P

        *[JSON-P]: JSON with Padding
      EOS

      @renderer.new.preprocess(markdown).must_equal <<-EOS.strip_heredoc.chomp
        <abbr title="JSON with Padding">JSON-P</abbr>
      EOS
    end

    it "converts abbrevations with numbers to HTML" do
      markdown = <<-EOS.strip_heredoc
        ES6

        *[ES6]: ECMAScript 6
      EOS

      @renderer.new.preprocess(markdown).must_equal <<-EOS.strip_heredoc.chomp
        <abbr title="ECMAScript 6">ES6</abbr>
      EOS
    end

  end

  describe "#acronym_regexp" do

    it "matches an acronym at the beginning of a line" do
      "FOO bar".must_match @renderer.new.acronym_regexp("FOO")
    end

    it "matches an acronym at the end of a line" do
      "bar FOO".must_match @renderer.new.acronym_regexp("FOO")
    end

    it "matches an acronym next to punctuation" do
      ".FOO.".must_match @renderer.new.acronym_regexp("FOO")
    end

    it "matches an acronym with hyphens" do
      "JSON-P".must_match @renderer.new.acronym_regexp("JSON-P")
    end

    it "doesn't match an acronym in the middle of a word" do
      "YOLOFOOYOLO".wont_match @renderer.new.acronym_regexp("FOO")
    end

    it "matches numbers" do
      "ES6".must_match @renderer.new.acronym_regexp("ES6")
    end

  end

end
