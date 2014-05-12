class Session < ActiveRecord::Base
  attr_accessible :data, :created_at, :updated_at
end