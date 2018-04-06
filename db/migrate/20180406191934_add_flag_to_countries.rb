class AddFlagToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :flag, :string
  end
end
