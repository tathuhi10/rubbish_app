class CreateRubbishes < ActiveRecord::Migration[5.2]
  def change
    create_table :rubbishes do |t|
      t.bigint :region_id
      t.string :name
      t.string :name_kana

      t.timestamps
    end
  end
end
