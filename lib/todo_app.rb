class TodoApp < CommandLineApp
  attr_reader :input, :output

  def initialize(input, output)
    @projects_array=[]
    @input = input
    @output = output
  end

  def real_puts message=""
    $stdout.puts message
  end

  def list
    if @projects_array.join("")==""
      puts "Projects:\n  none"
    else
      puts "Projects:\n  #{@projects_array.join(",")}"
    end
  end

  def create
    puts "Please enter the new project name:\n"
    new_project=gets.chomp
    @projects_array.push(new_project)
  end

  def edit
    puts "Please enter the project name to edit:\n"
    project_to_edit=gets.chomp
    puts "Please enter the new project name:\n"
    new_name=gets.chomp
    @projects_array[@projects_array.index(project_to_edit)]=new_name
  end

  def run

    while true
      puts "Welcome"
      puts "'list' to list projects"
      puts "'create' to create a new project"
      puts "'edit' to edit a project"

      input=gets.chomp
      if input=="list"
        list
      elsif input=="create"
        create
      elsif input=="edit"
        edit
      elsif input=="quit"
        break
      end

    end
  end
end
