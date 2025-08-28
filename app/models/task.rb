class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :priority, presence: true, inclusion: { in: 1..5 }

  scope :completed, -> { where(completed: true) }
  scope :pending, -> { where(completed: false) }
  scope :by_priority, -> { order(:priority, :due_date) }
  scope :overdue, -> { where('due_date < ? AND completed = ?', Date.current, false) }

  def overdue?
    due_date && due_date < Date.current && !completed?
  end

  def priority_label
    case priority
    when 1 then 'Very Low'
    when 2 then 'Low'
    when 3 then 'Medium'
    when 4 then 'High'
    when 5 then 'Very High'
    end
  end

  def priority_color
    case priority
    when 5 then 'danger'   # Very High
    when 4 then 'warning'  # High
    when 3 then 'info'     # Medium
    when 2 then 'secondary' # Low
    when 1 then 'light'    # Very Low
    end
  end
end