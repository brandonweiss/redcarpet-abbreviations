# Redcarpet::Abbreviations

An extension for Redcarpet that supports abbreviations. So this:

```
I'm pretty sure I'm not using this acronym right but hey YOLO.

*[YOLO]: You Only Live Once
```

Becomes this:

```
I'm pretty sure I'm not using this acronym right but hey <abbr title="You Only Live Once">YOLO</abbr>.
```

If you're thinking this would be better in Redcarpet, [yes I totally agree](https://github.com/vmg/redcarpet/issues/197), but I don't know C.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "redcarpet-abbreviations"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redcarpet-abbreviations

## Usage

Just include it in your renderer.

```ruby
class HTMLWithAbbreviations < Redcarpet::Render::HTML

  include Redcarpet::Render::HTMLAbbreviations

end
```

Remember to call `super` if your renderer has its own `preprocess` method, otherwise it will override the included `preprocess` method.

```ruby
class HTMLWithAbbreviations < Redcarpet::Render::HTML

  include Redcarpet::Render::HTMLAbbreviations

  def preprocess(document)
    document = super(document)

    # ...
  end

end
```

## Contributing

1. Fork it ( https://github.com/brandonweiss/redcarpet-abbreviations/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
