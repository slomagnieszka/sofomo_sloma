module Api
  module V1
    module Geolocations
      class Create < ApplicationService
        attributes :params

        def call
          @ip = params[:ip]
          @response = ipstack_params.parsed_response
          # return fail(Geolocation.new.errors) unless ipstack_params['success']
          geolocation = Geolocation.new(response_params)
          return fail(geolocation.errors) unless geolocation.valid?
          geolocation.save
          geolocation
        end

        private

        def ipstack_params
          HTTParty.get(Sofomo::Application.credentials.ipstack[:api_host] + '/' + @ip + '?access_key=' + Sofomo::Application.credentials.ipstack[:api_key])
        end

        def response_params
          {
            ip: @response['ip'],
            ip_type: @response['type'],
            continent_code: @response['continent_code'],
            continent_name: @response['continent_name'],
            country_code: @response['country_code'],
            country_name: @response['country_name'],
            region_code: @response['region_code'],
            region_name: @response['region_name'],
            city: @response['city'],
            zip: @response['zip'],
            latitude: @response['latitude'],
            longitude: @response['longitude'],
            geoname_id: @response['location']['geoname_id'],
            capital: @response['location']['capital'],
            is_eu: @response['location']['is_eu']
          }
        end
      end
    end
  end
end