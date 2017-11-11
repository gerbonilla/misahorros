class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :country
      t.string :fitch
      t.string :description

      t.timestamps
    end
  end
end
