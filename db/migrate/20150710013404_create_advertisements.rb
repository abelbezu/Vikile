class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
    	t.references :content
      t.string :url
      t.timestamps null: false
    end
  end
end
