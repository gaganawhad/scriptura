[![Build Status](https://travis-ci.org/gaganawhad/scripture-meta.png)](https://travis-ci.org/gaganawahd/scripture-meta)

This is a ruby library that provides operations related with meta information about the Bible

## Installation

Add this line to your application's Gemfile:

    gem 'scripture-meta'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scripture-meta

## Usage

There are four main classes in this library: 
  - ScriptureMeta
  - ScriptureBook
  - ScriptureChapter
  - ScriptureVerse

###ScriptureMeta

The way it is written, this is actually a module that encapsulates methods that scope the entire bible
```ruby
> ScriptureMeta.book_names
 => ["Genesis", "Exodus", "Leviticus", ... , "Revelation"]

 ```
###ScriptureBook

This is a ruby class that gets initialized by passing in the book number.

```ruby
> sb = ScriptureBook.new(1)
 => #<ScriptureBook:0x007fcb1b80f7f8 @number=1> 
> sb.name
  => "Genesis" 
```

Feel free to browse the code / test to get a sense of the API

```ruby
> ScriptureBook.new(1)
 => #<ScriptureBook:0x007f936199d378 @number=1> 

> ScriptureBook.new(1).name
 => "Genesis" 

> ScriptureMeta.book_names
 => ["Genesis", "Exodus", "Leviticus", ... , "Revelation"]

> ScriptureBook.find_by_name("Genesis")
 => #<ScriptureBook:0x007f93611f0670 @number=1>  
```

Note: Books with no chapters are considered to be books with one chapter


