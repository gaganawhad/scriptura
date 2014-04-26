$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'json'
json = File.read('lib/scriptura/metadata.json')
METADATA = JSON.parse(json)
require 'scriptura/scripture'
require 'scriptura/scripture_book'
require 'scriptura/scripture_chapter'
require 'scriptura/scripture_verse'
require 'scriptura/scripture_reference'
