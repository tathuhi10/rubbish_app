class ChangeKindToRubbish < ActiveRecord::Migration[5.2]
  def change
    change_column :rubbishes, :kind, :string
  end
end
