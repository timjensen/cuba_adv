class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :pro_type
      t.string :name
      t.text :descrip,        :default => "Discription to come"
      t.string :pro_image,    :default => "comingsoon.png"
      t.decimal :price,       :precision => 10, :scale => 2
      t.decimal :sprice,      :precision => 10, :scale => 2
      t.string :spec

      t.timestamps
    end
  end
end
