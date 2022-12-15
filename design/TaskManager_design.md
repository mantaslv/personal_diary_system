# TaskManager Class Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a user
> So that I can keep track of my tasks
> I want a program that I can add todo tasks to and see a list of them.

> As a user
> So that I can focus on tasks to complete
> I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class TaskManager
    def initialize
      # create empty array for tasks
    end

    def add(task) # task is a string
      # string message saying task was added
    end

    def list
      # throws exception if empty
      # returns list of tasks formatted as one string
    end

    def complete(task) # task is a string
      # throws exception if task does not exist
      # string message saying task was completed and removed from list
    end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# 1
task_manager = TaskManager.new
task_manager.add("Walk dog")        # => "Task was added: Walk dog"
task_manager.list                   # => "These are your tasks: Walk dog."
task_manager.complete("Walk dog")   # => "Walk dog was completed and removed from your list."
task_manager.list                   # => "You have no tasks to complete!"

# 2
task_manager = TaskManager.new
task_manager.add("Walk dog")        
task_manager.add("Water plants")    
task_manager.list                   # => "These are your tasks: Walk Dog, Water plants."
task_manager.complete("Walk Dog")   
task_manager.list                   # => "These are your tasks: Water plants."

# 3
task_manager = TaskManager.new
task_manager.add("Walk dog")            
task_manager.complete("Water plants")   # => "Water plants is not in your tasks."
```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
