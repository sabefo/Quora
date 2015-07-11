class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt
  validates :username, uniqueness: true
  has_many :questions, foreign_key: "author_id"
  has_many :answers, through: :questions
  has_many :responses, class_name: "Answer", foreign_key: "respond_id"

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(username, user_password)
    user = User.find_by(username: username)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end
