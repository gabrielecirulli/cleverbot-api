require 'net/http'
require 'digest/md5'

class CleverBot
  def initialize
    @service_uri = URI.parse 'http://cleverbot.com/webservicemin'
    @post_params = {
      'start' => 'y',
      'icognoid' => 'wsf',
      'fno' => '0',
      'sub' => 'Say',
      'islearning' => '1',
      'cleanslate' => 'false'
    }
    @backlog = []
  end

  def think thought
    @post_params['stimulus'] = thought
    response = make_request
    save_data response
    response[16] # Response text
  end

  def backlog
    result = []
    @backlog.each do |element|
      result.push element.clone
    end
    result
  end

  private
  def build_query
    current_query = @post_params.to_querystring
    @post_params['icognocheck'] = Digest::MD5.hexdigest current_query[9..28] # 20 characters
    @post_params.to_querystring
  end

  def make_request
    query_string = build_query
    request = Net::HTTP.new @service_uri.host, @service_uri.port
    request.read_timeout = nil
    request.open_timeout = nil

    request.start do |http|
      result = http.post @service_uri.path, query_string
      return result.body.split "\r"
    end
  end

  def save_data response
    @post_params['sessionid'] = response[1]
    @post_params['logurl'] = response[2]
    @post_params['vText8'] = response[3]
    @post_params['vText7'] = response[4]
    @post_params['vText6'] = response[5]
    @post_params['vText5'] = response[6]
    @post_params['vText4'] = response[7]
    @post_params['vText3'] = response[8]
    @post_params['vText2'] = response[9]
    @post_params['prevref'] = response[10]

    @post_params['emotionalhistory'] = response[12]
    @post_params['ttsLocMP3'] = response[13]
    @post_params['ttsLocTXT'] = response[14]
    @post_params['ttsLocTXT3'] = response[15]
    @post_params['ttsText'] = response[16]
    @post_params['lineRef'] = response[17]
    @post_params['lineURL'] = response[18]
    @post_params['linePOST'] = response[19]
    @post_params['lineChoices'] = response[20]
    @post_params['lineChoicesAbbrev'] = response[21]
    @post_params['typingData'] = response[22]
    @post_params['divert'] = response[23]

    @backlog.push ({'question' => @post_params['vText3'], 'answer' => @post_params['ttsText']})
  end
end


class Hash
  def to_querystring
    result = []
    self.keys.each_with_index do |key, index|
      result.push "#{URI::encode key}=#{URI::encode self[key].to_s}"
    end
    result.join '&'
  end
end