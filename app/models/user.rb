class User < ActiveRecord::Base
    validates_presence_of :account, :password, :name, :cell_phone, :privilege, :email, :email_yn
    validates_uniqueness_of :account, :message => " : This account is dupliated"
    validates_format_of :cell_phone, :with => /[0-9]{10}/
    validates_format_of :email, :with => /.*@.*\..*/
    #validates_inclusion_of :email_yn, :in => [0, 1], :message => " : please choose yes or no"
    
    has_many :order
    
    def is_admin?
        if privilege == 0
            return true
        else
            return false
        end
    end
end
