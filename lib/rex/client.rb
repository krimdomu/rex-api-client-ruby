#
# (c) Jan Gehring <jan.gehring@gmail.com>
#
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:

require 'rubygems'
require 'net/http'
require 'json'

require 'rex/client/commands/run'
require 'rex/client/commands/package'

module Rex

   module Client

      class Connection

         include Rex::Client::Commands::Run
         include Rex::Client::Commands::Package

         attr_accessor :endpoint
         attr_accessor :port

         def initialize(options)
            @endpoint = options[:endpoint]
            @port     = options.has_key?(:port) ? options[:port] : "80"
         end

         def send(url, data = {}, server_list = [])

            answers = {}

            server_list.get.each do |server|

               server_data = data
               server_data["user"]        = server.user
               server_data["password"]    = server.password
               server_data["private_key"] = server.private_key
               server_data["public_key"]  = server.public_key
               server_data["auth_type"]   = server.auth_type
               server_data["server"]      = server.name

               req = Net::HTTP::Post.new("#{url}", initheader = {"Content-Type" => "application/json", "Host" => @endpoint})
               req.body = server_data.to_json
               res = Net::HTTP.new(@endpoint, @port).start do |http|
                  http.request(req)
               end

               case res
                  when Net::HTTPSuccess
                     ref = JSON.parse(res.body)
                     if ref["ok"] == true
                        answers[server.name] = ref["return"]
                     else
                        answers[server.name] = nil
                     end
                  else
                     answers[server.name] = nil
               end

            end

            answers

         end

      end

   end

end
