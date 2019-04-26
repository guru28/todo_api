class Mutations::UpdateTask < Mutations::BaseMutation
  argument :id, ID, required:true
  argument :title, String, required: true
  argument :completed_status, Boolean, required: true

  field :task, Types::TaskType, null: false
  field :errors, [String], null: false

  def resolve(id:, title:, completed_status:)
    task = Task.find_by(id: id)

    if task.update(title: title, completed_status: completed_status)
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