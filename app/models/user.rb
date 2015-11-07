require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  # attr_reader :password
  # attr_accessor :password_verify

  # validates_confirmation_of :password

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
