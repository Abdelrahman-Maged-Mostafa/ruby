class User < ApplicationRecord
    before_save { self.email = email.downcase}
    before_save { self.password = BCrypt::Password.create(password) }
    has_many :articles
    validates :username, presence:true ,uniqueness:true,length:{minimum:3,maximum:25}

    VALID_EMAIL_REGEX = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/

    validates :email, presence:true,uniqueness:{case_sensitive:false},  length:{minimum:3,maximum:100},format:{with:VALID_EMAIL_REGEX}

    validates :password, presence:true,length:{minimum:8,maximum:14}
end