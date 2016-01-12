class Event < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :name, presence: true
  validates :date, presence: true
end
