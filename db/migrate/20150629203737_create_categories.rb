class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.column :name, :string
      t.timestamps
    end
    create_table :businesses do |t|
      t.column :name, :string
      t.column :address, :string
      t.column :website, :string
      t.column :phones, :string, :array => true
      t.column :hours, :string
      t.timestamps
    end
  end
end
