class User < ApplicationRecord


    def generate_token
        random_token = SecureRandom.urlsafe_base64()
        hashed_token = hash_token(random_token)
        self.update_attribute(:remember_token,hashed_token)
    end

    def forget_token
        self.update_attribute(:remember_token,nil)
    end

    def authenticate_token(token)
        return self.remember_token == token
    end

    private def hash_token(token)
        Digest::SHA256.base64digest(token)
    end

    
end
