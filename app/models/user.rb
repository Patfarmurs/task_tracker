class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :goals, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def completed_tasks_count
    tasks.where(completed: true).count
  end

  def completion_rate
    return 0 if tasks.count == 0
    (completed_tasks_count.to_f / tasks.count * 100).round(1)
  end
end
