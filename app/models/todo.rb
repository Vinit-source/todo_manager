class Todo < ActiveRecord::Base
  def self.overdue
    all.where("due_date < ?", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.completed
  all.where(completed:true)
  end

  def self.mark_as_complete(todo_id)
    todo = find(todo_id)
    todo.completed = true
    todo.save
    todo
  end
end
