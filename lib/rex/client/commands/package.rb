#
# (c) Jan Gehring <jan.gehring@gmail.com>
#
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:

module Rex
   module Client
      module Commands
         module Package

            def install(server_list, package)
               data = send(
                  "/api/1.0/package/install/#{package}", 
                  {
                     "args" =>[],
                  },
                  server_list
               )

               if data != nil
                  data
               else
                  return nil
               end
            end

            def remove(server_list, package)
               data = send(
                  "/api/1.0/package/remove/#{package}", 
                  {
                     "args" =>[],
                  },
                  server_list
               )

               if data != nil
                  data
               else
                  return nil
               end
            end

            def update_package_db(server_list)
               data = send(
                  "/api/1.0/package/update_package_db", 
                  {
                     "args" =>[],
                  },
                  server_list
               )

               if data != nil
                  data
               else
                  return nil
               end
            end

         end
      end
   end
end
