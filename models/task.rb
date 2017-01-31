require 'active_record'

class Task < ActiveRecord::Base
  validates :description, :priority, presence: true
end
