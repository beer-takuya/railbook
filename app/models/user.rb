class User < ActiveRecord::Base
  has_many :reviews
  has_many :books, :through => :reviews
  
  def self.authenticate(username, password)
    where(:username => username, :password => Digest::SHA1.hexdigest(password)).first
  end
end
