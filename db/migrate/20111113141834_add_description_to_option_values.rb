class AddDescriptionToOptionValues < ActiveRecord::Migration
  def self.up
    add_column :option_values, :description, :text unless column_exists?(:option_values, :description)
    add_column :option_value_translations, :description, :text unless column_exists?(:option_value_translations, :description)
  end

  def self.down
    remove_column :option_values, :description
    remove_column :option_value_translations, :description
  end
end
