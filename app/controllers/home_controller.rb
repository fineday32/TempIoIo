class HomeController < ApplicationController
  def index
  	@fields = [["Arts & Design","設計"],["Business & Management","商管"], ["Communication","傳播"], ["Education","教育"], ["Engineering","工程"], ["Humanities & Social Science","人文"], ["Law","法律"], ["MBA/EMBA","MBA"],  ["Medical & Public Health","衛生"], ["Science","科學"]]

  end
end
