class Task < ApplicationRecord
  belongs_to :user
  
  validates :name,:description, presence: true,  length: { maximum: 100 }
end
