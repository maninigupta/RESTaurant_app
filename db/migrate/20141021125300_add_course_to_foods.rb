class AddCourseToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :course, :string
  end
end
