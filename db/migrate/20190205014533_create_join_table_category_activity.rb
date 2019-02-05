class CreateJoinTableCategoryActivity < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :activities do |t|
       t.index [:category_id, :activity_id]
      # t.index [:activity_id, :category_id]
    end
  end
end
