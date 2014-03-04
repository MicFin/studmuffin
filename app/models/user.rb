class User < ActiveRecord::Base
  attr_accessible :email, :password, :fullname, :allergy_ids, :password_confirmation, :avatar
  devise :database_authenticatable, :registerable
  has_many :users_allergies
  has_many :notes
  has_many :allergies, through: :users_allergies

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
