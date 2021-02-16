class Event < ApplicationRecord

  has_many :attendances
  has_many :users, through: :attendances
=begin 
  validates :duration, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0}
  validates :title, length: {minimum: 5, maximum: 140}
  validates :description, length: {minimum: 20, maximum: 1000}
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000 }
  validates :location, presence: true
  validate :start_date

  def not_past_date
    if self.date < Date.today
      errors.add(:start_date, 'not in past')
    end
  end
=end
end
