class User < ApplicationRecord
    before_save { self.email = email.downcase}
    before_save :encrypt_password_if_present

    has_many :articles
    
    validates :username, presence:true ,uniqueness:true,length:{minimum:3,maximum:25}

    VALID_EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/

    validates :email, presence:true,uniqueness:{case_sensitive:false},  length:{minimum:3,maximum:100},format:{with:VALID_EMAIL_REGEX}

    validates :password, presence: true, length: { minimum: 8, maximum: 100 }, on: :create
    validates :password, length: { minimum: 8, maximum: 100 }, allow_blank: true, on: :update



    private

        def encrypt_password_if_present
            if will_save_change_to_password? && password.present?
                self.password = BCrypt::Password.create(password)
            end
        end


end