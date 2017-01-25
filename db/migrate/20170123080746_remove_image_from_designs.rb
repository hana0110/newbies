class RemoveImageFromDesigns < ActiveRecord::Migration
  def change
    remove_column :designs, :image, :text
  end
end
