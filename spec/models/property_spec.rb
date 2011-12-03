# encoding: UTF-8
require 'spec_helper'

describe Property do
  describe 'translation system' do
    before(:all) do
      I18n.locale = 'en-US'
      @property = Property.new(:name => "some name for validation", :presentation => 'english presentation')                         
      I18n.locale = 'pt-BR'
      @property.presentation = 'apresentação em português'
    end

    describe " should translate the product" do
      it 'to en_US' do
        I18n.locale = 'en-US'
        @property.presentation.should eql 'english presentation'
      end
      
      it 'to pt-BR' do
        I18n.locale = 'pt-BR'
        @property.presentation.should eql 'apresentação em português'
      end
    end
  end
end
