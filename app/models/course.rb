class Course < ApplicationRecord

  validates :short_name, presence: true, length: {minimum: 4, maximum: 6}
  validates :name, presence: true, length: {minimum: 6, maximum: 40}
  validates :description, presence: true, length: {minimum: 10, maximum: 100}
  
end