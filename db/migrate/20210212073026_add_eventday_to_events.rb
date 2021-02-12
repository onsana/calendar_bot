class AddEventdayToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :eventday, :integer
  end
end
