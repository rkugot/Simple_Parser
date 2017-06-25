class CreateProducts < ActiveRecord::Migration[5.1]
    def change
    	create_table :products do |t|
    		t.text :title
    		t.text :pack
    		t.decimal :price
    		t.text :image
    		t.timestamps
    	end
    end
end
