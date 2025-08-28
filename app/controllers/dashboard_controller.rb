class DashboardController < ApplicationController
  def index
    @tasks = current_user.tasks.pending.by_priority.limit(5)
    @overdue_tasks = current_user.tasks.overdue.limit(3)
    @goals = current_user.goals.in_progress.by_target_date.limit(3)
    @completed_tasks_count = current_user.tasks.completed.count
    @total_tasks_count = current_user.tasks.count
    @completion_rate = current_user.completion_rate
  end
end