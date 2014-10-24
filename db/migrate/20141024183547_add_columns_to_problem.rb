class AddColumnsToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :description, :string
    add_column :problems, :attempt, :text
    add_reference :problems, :user, index: true
    add_column :problems, :solved, :boolean, null: false, default: false
  end
end
