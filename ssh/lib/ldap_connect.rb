require 'ldap'

module LDAP

         def self.authenticate(user,password)
            if user == "" || password == ""
                return false
            end
            ldap_con = LDAP::Conn.new('172.16.33.105', 389)
 #           ldap_con.bind(user, password)
            if ldap_con.bind(user, password)
                user_mail = []
                ldap_con.search('o=cleartrip',LDAP::LDAP_SCOPE_SUBTREE,"cn=#{user}",'mail') {|entry|
                    user_mail << entry.vals('mail')
                }
                puts user_mail[0]
                ldap_con.unbind
                return user_mail[0]
           else

               return false
           end
       end
end 
