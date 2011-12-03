class AddProductPropertyTranslationTable < ActiveRecord::Migration
  def self.up
    ProductProperty.create_translation_table! :value => :string
  end

  def self.down
    ProductProperty.drop_translation_table!
  end
end
