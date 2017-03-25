class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
    	t.string     :content
    	t.json       :images
    	t.belongs_to :user
    	t.boolean    :status, :default => false

      t.timestamps
    end
  end
end
