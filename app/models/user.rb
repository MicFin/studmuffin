class User < ActiveRecord::Base
  attr_accessible :email, :password
  devise :database_authenticatable
  has_many :notes
end
