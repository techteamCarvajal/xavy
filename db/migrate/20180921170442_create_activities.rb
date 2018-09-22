class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :venue, foreign_key: true
      t.string :name
      t.text :schedule

      t.timestamps
    end
  end
end
