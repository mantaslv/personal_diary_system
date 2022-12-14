class TaskManager
    def initialize
      # create empty array for tasks
        @task_arr = []
    end

    def add(task) # task is a string
      # string message saying task was added
        fail "Please enter text only!" unless task.is_a? String
        fail "Please enter some text!" if task.match?(/^\s*$/)
        @task_arr.push(task)
        return "Task was added: " + task
    end

    def list
      # throws exception if empty
      # returns list of tasks formatted as one string
        if @task_arr.count == 0
            return "You have no tasks to complete!"
        else
            return "These are your tasks: " + @task_arr.join(", ") + "."
        end
    end

    def complete(task) # task is a string
      # throws exception if task does not exist
      # string message saying task was completed and removed from list
        if @task_arr.include? task
          @task_arr.delete(task)
          return task + " was completed and removed from your list."
        else
          return task + " is not in your tasks."
        end
    end
end