#
# (c) Jan Gehring <jan.gehring@gmail.com>
#
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:

module Rex
   module Client
      module Commands
         module Run

            def run(server_list, cmd)
               send(
                  "/api/1.0/run", 
                  {
                     "args" => [cmd],
                  },
                  server_list
               )
            end

         end
      end
   end
end
