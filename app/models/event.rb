class Event < ActiveRecord::Base
  attr_accessible :allday, :description, :enddate, :startdate, :title
end
