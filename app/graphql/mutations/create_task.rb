class Mutations::CreateTask < Mutations::BaseMutation
  argument :title, String, required: true
  argument :completed_status, Boolean, required: true

  field :task, Types::TaskType, null: false
  field :errors, [String], null: false

  def resolve(title:, completed_status:)
    task = Task.new(title: title, completed_status: completed_status)
    if task.save
      # Successful creation, return the created object with no errors
      {
        task: task,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        task: nil,
        errors: task.errors.full_messages
      }
    end
  end
end