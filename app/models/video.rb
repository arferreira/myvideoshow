class Video < ApplicationRecord
  
  before_validation :set_status, on: :create
  
  belongs_to :user
  enum status: [:active, :inactive]
  validates :name, :description, :user, :url, :status, presence: true

  def set_status
    self.status = :active
  end
  
end
