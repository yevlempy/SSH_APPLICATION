  class LdapUser < ActiveLdap:Base
   #   validates_presence_of :username
      ldap_mapping :prefix => "cn=users"
    def self.login(username, password)
      ActiveLdap::Base.connect \
        :host => "172.16.33.105",
        :port => 389,
        :base => "dc=your,dc=base",
        :bind_format => "uid=#{username},cn=users,dc=your,dc=ldap,dc=binding,dc=config,dc=com",
        :password_block => Proc.new { password },
        :allow_anonymous => false
                                      
     return true
  rescue ActiveLdap::AuthenticationError
     return false
  ensure
     ActiveLdap::Base.close
     end
end
