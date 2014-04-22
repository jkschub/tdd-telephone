class Task
    attr_accessor :title, :description, :status, :created_at

    def initialize(title, description, status="incomplete")
        @title = title
        @description = description
        @status = status
        @created_at = Time.now
    end

    def mark_as_complete!
      @status = "complete"
    end

    def mark_as_incomplete!
      @status = "incomplete"
    end

    def complete?
      if @status == "complete"
        return true
      else
        return false
      end
    end
end

class TodoList
  attr_accessor :title, :list, :completion_status, :completed_tasks_array, :incomplete_tasks_array

  def initialize(title)
    @title = title
    @list = []
    @completion_status = false
    @completed_tasks_array = []
    @incomplete_tasks_array = []
  end

  def add_task(task)
    list << task
  end

  def complete_all!
    list.each do |task|
      task.mark_as_complete!
    end
    @completion_status = true
  end

  def complete?
    if @completion_status == true
      return true
    else
      return false
    end
  end

  def completed_tasks
    list.each do |task|
      if task.status == "complete"
        completed_tasks_array << task
      end
    end
      completed_tasks_array
  end

  def incomplete_tasks
    list.each do |task|
      if task.status == "incomplete"
        incomplete_tasks_array << task
      end
    end
      incomplete_tasks_array
  end

end
