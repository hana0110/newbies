class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string      :user_id
      t.text        :text
      t.text        :image
      t.datetime    :publishdate
      t.timestamps
    end
  end
end
