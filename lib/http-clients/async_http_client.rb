require 'async/http/internet/instance'

module HTTPClients
  class AsyncHttpClient < BaseClient
    OK_STATUS = "200 OK".freeze

    def initialize(endpoint, persistent, concurrent)
      super

      @number = 0
    end

    def name
      "Async HTTP"
    end

    def run_once
      Sync do
        Async::HTTP::Internet.get(endpoint) do |response|
          response.status
        end
      end
    end

    def run_once_persistent
      Sync do
        Async::HTTP::Internet.get(endpoint) do |response|
          response.status
        end
      end
    end


    def response_ok?(response)
      response == 200
    end
  end
end
