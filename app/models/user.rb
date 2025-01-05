class User < ApplicationRecord
    # Include bcrypt for secure password handling
    has_secure_password
    
    # Validations
    validates :name, presence: true, length: { minimum: 2, maximum: 50 }
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { minimum: 6 }, if: -> { password.present? }
    
    # Callbacks (optional)
    before_save :downcase_email
    
    private
    
    def downcase_email
        self.email = email.downcase
    end
end
    