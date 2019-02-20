class UpdateRequestsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :start_date, :date
    add_column :requests, :end_date, :date
    change_column :requests, :status, :string, :default => "0"
  end
end
