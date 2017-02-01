require 'active_record'

class Task < ActiveRecord::Base
  validates :description, presence: true
  validates :priority, numericality: {only_integer: true}

  scope :id, -> (id) { where(id: id) }
  scope :description, -> (description) { where("description ILIKE ?", "%#{description}%") }
  scope :priority, -> (priority) { where(priority: priority) }
  scope :completed, -> (completed) { where(completed: completed) }
end
