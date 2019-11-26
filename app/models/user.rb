class User < ApplicationRecord
  has_secure_password

  validates :email, :presence => true
  validates :username, presence: true
  # I don't think I need these two statements anymore now that I have the other ones:
  # validates :email, :presence => true
  # validates :email, :uniqueness => true

  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }

  # Article on setting all emails to lower case:
  # https://stackoverflow.com/questions/6422211/rails-3-validating-email-uniqueness-and-case-sensitive-fails

  # This no longer works now that we're requiring new users to have a username and email
  # def self.find_or_create_by_omniauth(auth_hash)
  #   # I changed the ["info"]["email"] to ["info"]["name"] because the email value is
  #   # "nill" when I type "auth_hash["info"]["email"]" into the browser's error console
  #   self.where(:email => auth_hash["info"]["name"]).first_or_create do |user|
  #     user.password = SecureRandom.hex, user.username = "OmniAuth User"
  #   end
  # end

  def self.find_or_create_by_omniauth(auth_hash)
    # I changed the ["info"]["email"] to ["info"]["name"] because the email value is
    # "nill" when I type "auth_hash["info"]["email"]" into the browser's error console.
    # this is because in my particular
    self.where(:username => auth_hash["info"]["name"]).first_or_create do |user|
      # for simplification purposes, the username & email for an omniauth user
      # will be exactly the same value because we never need to know the email
      # address of the user in this program, additionally, there is no actual
      # email address exposed within the auth_hash from GitHub.
      user.password = SecureRandom.hex,
      if auth_hash["info"]["email"] == nil # that is, no email address is listed.
        # some GitHub users have their email set to private.  If that is the
        # case, the user's email address will be set to this value below:
        user.email = "unknown: GitHub doesn't share this user's email"
      else # if the user's GitHub account has a public email address...
        # the user's email address in this app will be the same as their GitHub
        # email address.
        user.email = auth_hash["info"]["email"]
      end
    end
  end
end
