class AddStatusToTask < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :status, :string, default: "Incomplete"
  end
end
