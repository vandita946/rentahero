class CreateSuperheros < ActiveRecord::Migration[6.0]
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :superpower
      t.string :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
