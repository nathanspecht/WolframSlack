class Api::QuestionsController < ApplicationController
  def create
    query = slack_params[:text]
    request_url = "http://api.wolframalpha.com/v2/query?input=#{query}&appid=#{ENV['wolfram_api_id']}"
    resp = Net::HTTP.get(URI.parse(request_url))

    xml_resp = Nokogiri::XML(resp)

    #fetches the second image result
    resp_imgs = xml_resp.xpath('//img')[1]

    render text: resp_imgs
  end

  private

  def slack_params
    params.permit(:text)
  end
end
