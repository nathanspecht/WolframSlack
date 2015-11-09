class Api::QuestionsController < ApplicationController
  def create
    query = slack_params[:text]
    request_url = "http://api.wolframalpha.com/v2/query?input=#{query}&appid=#{ENV['wolfram_api_id']}"
    resp = Net::HTTP.get(URI.parse(request_url))

    xml_resp = Nokogiri::XML(resp)
    resp_imgs = xml_resp.xpath('//img')

    #fetches the first three image results
    render text: resp_imgs[0..2]
  end

  private

  def slack_params
    params.permit(:text)
  end
end
