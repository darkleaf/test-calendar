class Event < ActiveRecord::Base
  extend Enumerize

  belongs_to :user

  enumerize :repeat_period, in: { day: 1.day, week: 1.week, month: 1.month, year: 1.year }

  validates :user, presence: true
  validates :name, presence: true
  validates :date, presence: true
end
