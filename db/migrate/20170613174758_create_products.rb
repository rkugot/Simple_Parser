class CreateProducts < ActiveRecord::Migration[5.1]
    def change
    	create_table :products do |t|
    		t.text :title
    		t.decimal :pack
    		t.text :unit
    		t.decimal :price
    		t.text :image
    		t.timestamps
    	end
    end
end
