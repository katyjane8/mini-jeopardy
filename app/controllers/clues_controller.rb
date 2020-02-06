class CluesController < ApplicationController
  require 'rest-client'
  require 'json'

  def index
    @clues_count = get_clues.count
    @clues = get_clues
  end

  def get_clues
    get_response("clues/?category=25")
    .select{ |c| c["airdate"] >= "1996" && c["value"].present?}
    .sort_by{ |d| d["value"] }
  end

  def get_response(url)
    base_url = "http://jservice.io/api/"
    response = RestClient.get(base_url + url)
    JSON.parse(response)
  end
end


# spec
# 1) validation conectivity (clues), expect( (json...).is_a? Hash) to truthy
# 2) validation from clues
# 3) validate select && sorting
# 4)
#
# Comments
# DRY
# 1) get response is there for future scalation
# 2) new urls can be added for search on api
