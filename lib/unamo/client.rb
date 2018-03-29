require 'rest-client'
require 'json'

module Unamo
  class Client
    BASE = 'https://seo.unamo.com/api/v1/'
    CAMPAINS_URL = "#{BASE}campaigns.json"

    class << self
      def api(url)
        response = RestClient.get url, {accept: :Jason, token: ENV['UNAMO_TOKEN']}
        JSON.parse(response)
      end

      def campains
        Unamo::Client.api(CAMPAINS_URL)
      rescue RestClient::ExceptionWithResponse
        []
      end

      def campain_positions(id, date_from, date_to)
        url = "#{BASE}campaigns/#{id}/positions.json?date_from=#{date_from}&date_to=#{date_to}&mobile=<true|false>"
        Unamo::Client.api(url)
      rescue RestClient::ExceptionWithResponse
        {}
      end

      def keywords(id)
        url = "#{BASE}campaigns/#{id}/keywords.json"
        Unamo::Client.api(url)
      rescue RestClient::ExceptionWithResponse
        []
      end

      def groups(id)
        url = "#{BASE}campaigns/#{id}/groups.json"
        Unamo::Client.api(url)
      rescue RestClient::ExceptionWithResponse
        []
      end
    end
  end
end
