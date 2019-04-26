module Types
  class TaskType < Types::BaseObject
  	field :id, ID, null: false
    field :title, String, null: false
    field :completed_status, Boolean, null: false
  end
end