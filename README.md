[![Build Status](https://travis-ci.org/gaganawhad/scriptura.png)](https://travis-ci.org/gaganawahd/scriptura)
[![Code Climate](https://codeclimate.com/github/gaganawhad/scriptura.png)](https://codeclimate.com/github/gaganawhad/scriptura)

This is a ruby library that provides operations related with meta information about the Bible

## Installation

Add this line to your application's Gemfile:

    gem 'scriptura'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scriptura

## Usage

There are four main classes in this library: 
  - ScriptureMeta
  - ScriptureBook
  - ScriptureChapter
  - ScriptureVerse
  - ScriptureReference

###ScriptureMeta

The way it is written, this is actually a module that encapsulates methods that scope the entire bible
```ruby
> ScriptureMeta.book_names
 => ["Genesis", "Exodus", "Leviticus", ... , "Revelation"]

 ```
###ScriptureBook

This is a ruby class that gets initialized by passing in the book number. You can also `find_by_name` the book or `find` it by its 'string_id'

Note: Books with no chapters are considered to be books with one chapter

```ruby
> sb = ScriptureBook.new(1)
 => #<ScriptureBook:0x007fcb1b80f7f8 @number=1> 
> sb.name
  => "Genesis" 
> ScriptureBook.find_by_name("1 Corinthians")
 => #<ScriptureBook:0x007fa194831e80 @number=46> 
> ScriptureBook.find_by_name("1 Corinthians").number
 => 46 
> ScriptureBook.find("1-corinthians")
 => #<ScriptureBook:0x007fa195866378 @number=46> 
> ScriptureBook.find("1-corinthians").number
 => 46 
> ScriptureBook.find("1-corinthians").number_of_chapters
 => 16 
```

It raises an error when trying to initalize a scripture book that doesn't exist

```ruby
> ScriptureBook.new(67)
RuntimeError: book number should be within 1-66
.
.

```

Feel free to browse the code / test to get a sense of the API



