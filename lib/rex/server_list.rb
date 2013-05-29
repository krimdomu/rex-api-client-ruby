#
# (c) Jan Gehring <jan.gehring@gmail.com>
#
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:

module Rex

   class ServerList

      attr_accessor :servers

      def initialize()
         @servers = Array.new
      end

      def add(server)
         @servers << server
      end

      def get
         @servers
      end

   end

end
