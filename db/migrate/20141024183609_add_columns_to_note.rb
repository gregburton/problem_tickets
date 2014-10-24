class AddColumnsToNote < ActiveRecord::Migration
  def change
    add_column :notes, :text, :text
    add_reference :notes, :user, index: true
    add_reference :notes, :problem, index: true
  end
end
