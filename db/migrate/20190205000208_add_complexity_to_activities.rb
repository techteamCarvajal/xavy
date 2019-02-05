class AddComplexityToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :complexity, :string
  end
end
