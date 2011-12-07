# Spree Extension: Product Translations
This extension allows you to translate product details on an intuitive way based on tabs.
Currently it will load tabs for all locales in `I18n.available_locales`.

Prepared for Spree 0.70.1 and Rails 3.1

Its inspired and started from:

[Fabien](https://github.com/fabien) fork of [spree-simple_product_translations](https://github.com/fabien/spree-simple_product_translations) in the 3.1 branch
[Fabien](https://github.com/fabien) fork of [spree-product_translations](https://github.com/fabien/spree-product_translations)

Both original from [jeroenj](https://github.com/jeroenj)

#On Travis CI
[![Build Status](https://secure.travis-ci.org/argami/spree_product_translation.png)](http://travis-ci.org/argami/spree_product_translation)

# Installation
In your Gemfile you just add:

    <pre>
    gem 'spree_product_translations'
    </pre>
    
    or
    
    <pre>
    gem 'spree_product_translations', :git => 'https://github.com/argami/spree_product_translation', :tag => 'v0.0.1'
    </pre>
    
    to use edge
    
    <pre>
      gem 'spree_product_translations', :git => 'https://github.com/argami/spree_product_translation'
    </pre>

Then install the gem:

    bundle install

Then copy the migrations and assets to your spree application:

    rails g spree_product_translations:install

Finally migrate your database:

    rake db:migrate

If you have pre-existing data, you'll need to run this rake task:

    rake spree:extensions:product_translations:globalize_legacy_data