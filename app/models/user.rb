class User < ApplicationRecord
  rolify
    has_secure_password #validate password and pass conf matc 
                        #password & password_conf virtual 
    after_create :assign_default_role

    def assign_default_role
        self.add_role(:default) if self.roles.blank?
     end    
     def role
      roles.collect(&:name).join(', ')
    end                    
end
