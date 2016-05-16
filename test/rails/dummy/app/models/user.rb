class User < ActiveRecord::Base
  has_secure_password
  
  validates :email, presence: true, uniqueness: true, format: /@/
  
  before_create { generate_token(:auth_token) }
  
  def self.authenticate(email, password)
    user = find_by email: email
    user if user && user.authenticate(password)
  end
    
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def prepare_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
  end
end