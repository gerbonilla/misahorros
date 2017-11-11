class CreateBonds < ActiveRecord::Migration[5.1]
  def change
    create_table :bonds do |t|
      t.float :effective_rate
      t.float :term_months
      t.float :term_years
      t.references :bank, foreign_key: true
      t.string :country
      t.float :nominal_rate
      t.string :guarantee
      t.string :currency
      t.string :minimum
      t.string :maximum

      t.timestamps
    end
  end
end
