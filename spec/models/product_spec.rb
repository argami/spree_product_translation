# encoding: UTF-8
require 'spec_helper'

describe Product do
  describe 'translation system' do
    before(:all) do
      I18n.locale = 'en-US'
      @product = Product.new(
       :price => 10, 
       :permalink => 'TEST',
       :name => 'english name',
                              :description => 'english description',
                              :meta_description => 'english meta_description', 
                              :meta_keywords => 'english meta_keywords'
                              )                         
      I18n.locale = 'pt-BR'
      @product.name = 'nome em português'
      @product.description = 'descrição em português'
      @product.meta_description = 'meta descrição em português'
      @product.meta_keywords = 'meta palavras-chave em português'
    end

    describe " should translate the product" do
      it 'to en_US' do
        I18n.locale = 'en-US'
        @product.name.should eql 'english name'
        @product.description.should eql 'english description'
        @product.meta_description.should eql 'english meta_description'
        @product.meta_keywords.should eql 'english meta_keywords'
      end
      
      it 'to pt-BR' do
        I18n.locale = 'pt-BR'
        @product.name.should eql 'nome em português'
        @product.description.should eql 'descrição em português'
        @product.meta_description.should eql 'meta descrição em português'
        @product.meta_keywords.should eql 'meta palavras-chave em português'
      end
    end
  end
end