class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.string :name

      t.timestamps
    end
  end
end
