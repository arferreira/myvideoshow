class Video < ApplicationRecord
  
  belongs_to :user
  before_create :set_status
  enum status: [:active, :inactive]
  validates :name, :description, :user, :url, :status, presence: true

  def set_status
    self.status = :active
  end
  
end
