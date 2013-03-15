require 'nokogiri'
require 'date'

files = ['version', 'dividend_history']
files.each do |file|
  require File.join('nasdaq_query', file)
end

