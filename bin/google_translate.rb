#!/usr/bin/env ruby
# set: fileencoding=utf-8 :
# require 'open-uri'
require 'httparty'

class GTranslate
  include HTTParty
  #debug_output $stderr
  base_uri "https://www.googleapis.com/language/translate"

  def initialize(key)
    @key = key
  end

  def t(q)
    obj = self.class.get('/v2', query: { "key" => @key, "q" => q, "target" => 'ja', headers: { "Refferer" => "https://ruseel.dev.daumcorp.com/x" }})
    obj["data"]["translations"].map { |t| t["translatedText"] }
  end
end


# api_key not defined
trans = GTranslate.new(api_key)
_t = trans.t(ARGV[0])
print _t[0]



