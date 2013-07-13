$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'scripture_meta'
require 'scripture_book'
require 'scripture_chapter'
require 'scripture_verse'

sb = ScriptureBook.new(1)
puts sb.name

