class Video < ApplicationRecord
  
  #before_validation :set_status, on: :create
  
  belongs_to :user
  enum status: {
    "active": 0,
    "inactive": 1
  }

  validates :name, :description, :user, :url, :skin,:status, presence: true

  def set_status
    self.status = :active
  end

  def count_viewed
    self.count
  end
  
end
