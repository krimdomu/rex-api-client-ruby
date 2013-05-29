#
# (c) Jan Gehring <jan.gehring@gmail.com>
#
# vim: set ts=3 sw=3 tw=0:
# vim: set expandtab:

module Rex

   class Server

      attr_accessor :user
      attr_accessor :password
      attr_accessor :private_key
      attr_accessor :public_key
      attr_accessor :auth_type
      attr_accessor :name

      def initialize(options)
         @user        = options.has_key?(:user)        ? options[:user]        : ""
         @password    = options.has_key?(:password)    ? options[:password]    : ""
         @private_key = options.has_key?(:private_key) ? options[:private_key] : ""
         @public_key  = options.has_key?(:public_key)  ? options[:public_key]  : ""
         @auth_type   = options.has_key?(:auth_type)   ? options[:auth_type]   : ""
         @name        = options.has_key?(:name)        ? options[:name]        : ""
      end

   end

end
