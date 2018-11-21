class AddKindToRubbish < ActiveRecord::Migration[5.2]
  def change
    add_column :rubbishes, :kind, :integer
    add_column :rubbishes, :remarks, :string
  end
end
