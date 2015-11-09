require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  # attr_reader :username
  # attr_reader :email
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :firstname, String
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
