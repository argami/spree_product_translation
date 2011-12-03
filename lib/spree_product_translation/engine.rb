require 'globalize3'

module SpreeProductTranslation
  class Engine < Rails::Engine
    engine_name 'spree_product_translation'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
      
      ::Product.class_eval do
        translates :name, :description, :meta_description, :meta_keywords, :copy => true

        accepts_nested_attributes_for :translations
      end
      
      ::ProductProperty.class_eval do
        translates :value, :copy => true

        accepts_nested_attributes_for :translations, :reject_if => proc { |attributes| attributes['value'].blank? }
        validates_presence_of :value
      end
      
      ::Property.class_eval do
        translates :presentation

        accepts_nested_attributes_for :translations
      end
      
      ::Prototype.class_eval do
        translates :name, :copy => true

        accepts_nested_attributes_for :translations
      end
      
      ::Taxonomy.class_eval do
        translates :name, :copy => true

        accepts_nested_attributes_for :translations
      end
      
      
      ::Taxon.class_eval do
        translates :name, :description, :copy => true
        
        accepts_nested_attributes_for :translations
      end

      ::OptionType.class_eval do
        translates :presentation
        
        accepts_nested_attributes_for :translations, :reject_if => proc { |attributes| attributes['presentation'].blank? }
        accepts_nested_attributes_for :option_values, :allow_destroy => true
      end

      ::OptionValue.class_eval do
        translates :presentation
        
        accepts_nested_attributes_for :translations, :reject_if => proc { |attributes| attributes['presentation'].blank? }
        validates_presence_of :name
      end
      
      # Enable I18n fallbacks
      require 'i18n/backend/fallbacks'
      
    end

    config.to_prepare &method(:activate).to_proc
  end
end
