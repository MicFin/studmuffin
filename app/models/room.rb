class Room < ActiveRecord::Base
  attr_accessible :name, :public, :sessionId, :dietitian_id
  has_many :appointments
  belongs_to :dietitian
end
