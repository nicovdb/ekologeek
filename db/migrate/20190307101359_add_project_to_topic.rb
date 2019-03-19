class AddProjectToTopic < ActiveRecord::Migration[5.2]
  def change
    add_reference :topics, :project, index: true
  end
end
