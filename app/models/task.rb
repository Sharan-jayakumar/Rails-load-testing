class Task < ApplicationRecord
  # Validations
  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  
  # Scopes
  scope :active, -> { where(deleted_at: nil) }
  scope :completed, -> { where(is_completed: true) }
  scope :pending, -> { where(is_completed: false) }
  
  # Soft delete
  def soft_delete
    update(deleted_at: Time.current)
  end
  
  def restore
    update(deleted_at: nil)
  end
  
  def deleted?
    deleted_at.present?
  end
  
  def completed?
    is_completed?
  end
  
  def mark_as_completed!
    update(is_completed: true)
  end
  
  def mark_as_pending!
    update(is_completed: false)
  end
end 