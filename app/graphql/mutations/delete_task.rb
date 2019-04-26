class Mutations::DeleteTask < Mutations::BaseMutation
  argument :id, ID, required:true

  field :message, String, null: false
  field :errors, [String], null: false


  def resolve(id:)
    task = Task.find_by(id: id)

    if task.destroy
      # Successful creation, return the created object with no errors
      {
        message: "Successfully deleted the task",
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