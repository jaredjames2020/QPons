class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.integer :company_id
      t.integer :path_id
      t.integer :discount
      t.text :description

      t.timestamps
    end
  end
end
