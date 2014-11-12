class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output
    @projects = {}
    @selected_project = ""
    @task_array = []
  end

  def real_puts message=""
      $stdout.puts message
  end

  def list
    if @projects.length == 0
      puts "Projects:\n  none"
    else
      puts "Projects:\n  #{@projects.keys.join(",")}"
    end
  end

  def create
    puts "Please enter the new project name:\n"
    # @projects.push(gets.chomp)
    @projects[gets.chomp] = []
  end

  def rename
    puts "Please enter the project name to rename:\n"
    old_key = gets.chomp
    puts "Please enter the new project name:\n"
    new_key = gets.chomp
    @projects[new_key] = []
    @projects[new_key] = @projects[old_key]
    @projects.delete(old_key)

  end

  def list_tasks
    if @projects[@selected_project].empty?
    puts "  none"
    else
    @projects[@selected_project].each {|value| puts value}
    #puts @projects.each |key, value|
    end
  end

  def create_task
    puts "Whats the name of the task?"
    task = gets.chomp
    #@projects[@selected_project] = task
    @projects[@selected_project].push(task)
    #puts "Created task: #{@projects[@selected_project]}"
  end

  def edit_task
    puts "What's the name of the task we are changing?"
    task1 = gets.chomp
    if @projects[@selected_project].include?(task1)
        puts "What are we changing it's name to?"
        task2 = gets.chomp
        @projects[@selected_project].delete(task1)
        @projects[@selected_project].push(task2)
    else
    puts "task not found: 'not here'"
    end
  end

  def complete_task
    puts "What task is completed?"
    completed_task = gets.chomp
    if @projects[@selected_project].include?(completed_task)
       @projects[@selected_project].delete(completed_task)
       @projects[@selected_project].push("#{completed_task}: completed")
    else
       puts "task not found: 'not here'"
    end
  end


  def edit
    puts "Please enter the project name to edit:\n"
    @selected_project = gets.chomp
    puts "Editing Project: #{@selected_project}"
    while true
      puts "'list' to list tasks"
      puts "'create' to create a new task"
      puts "'edit' to edit a task"
      puts "'complete' to complete a task and remove it from the list"
      answer = gets.chomp
      if answer == "list"
      list_tasks
      end

      if answer == "create"
      create_task
      end

      if answer == "edit"
      edit_task
      end

      if answer == "complete"
      complete_task
      end

      if answer == "back"
        break
      end
    end
  end

  def delete
    puts "Please enter the project name to delete:\n"
    to_remove = gets.chomp
    @projects.delete(to_remove)
  end

  def run

   while true
     puts "Welcome"
     puts "'list' to list projects"
     puts "'create' to create a new project"
     puts "'rename' to rename a project"
     puts "'edit' to edit a project"
     puts "'delete' to delete a project"
     user_input = gets.chomp
    if user_input == "list"
      list
    end

    if user_input == "create"
      create
    end

    if user_input == "rename"
      rename
    end

    if user_input == "edit"
      edit
    end

    if user_input == "delete"
      delete
    end

    if user_input == 'quit'
      break
    end
   end

  end
end
