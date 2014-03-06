class User < ActiveRecord::Base
  attr_accessible :email, :password, :fullname, :allergy_ids, :password_confirmation, :avatar
  devise :database_authenticatable, :registerable
  has_many :users_allergies
  has_many :notes
  has_many :allergies, through: :users_allergies
  has_many :avatars
  accepts_nested_attributes_for :avatars, :allow_destroy => true

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg)
  end
