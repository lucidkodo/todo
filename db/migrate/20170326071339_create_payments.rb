class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
    	t.integer    :total
    	t.belongs_to :user
    	
      t.timestamps
    end
  end
end
