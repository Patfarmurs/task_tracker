class Goal < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :progress, presence: true, inclusion: { in: 0..100 }

  scope :completed, -> { where(completed: true) }
  scope :in_progress, -> { where(completed: false) }
  scope :by_target_date, -> { order(:target_date) }

  def progress_color
    case progress
    when 0..25 then 'danger'
    when 26..50 then 'warning'
    when 51..75 then 'info'
    when 76..100 then 'success'
    end
  end

  def days_remaining
    return 0 unless target_date
    (target_date - Date.current).to_i
  end
end