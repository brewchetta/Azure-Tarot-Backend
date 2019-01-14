class FixTypeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :spreads, :type, :spread_type
  end
end
