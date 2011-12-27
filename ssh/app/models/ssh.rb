class Ssh < ActiveRecord::Base
    validate :ssh_key_format
    before_save :append_email_to_ssh
    def append_email_to_ssh
        self.ssh_key = self.ssh_key.split(" ")[0] + " " + self.ssh_key.split(" ")[1]
        self.ssh_key = self.ssh_key.split("==")[0] +  "== " + self.Email_id
    end
    validates_presence_of :name, :message => "Enter the name bugger"
    validates_presence_of :phone_number, :numericality => true, :message => "Enter the phone number bugger"
    validates_length_of :phone_number, :in => 10..12, :allow_blank => true 
    def ssh_key_format
        if /^ssh-rsa|^ssh-dsa/i =~ self.ssh_key
            return true
        else
#            error.add(:ssh_key_format "Enter the correct ssh key bugger")
           errors.add_to_base("Enter the ssh key, you can get that inside /home/.ssh/id_rsa.pub bugger")
           return false
        end
    end

end
