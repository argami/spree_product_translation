# encoding: UTF-8
require 'spec_helper'

describe OptionType do
  describe 'translation system' do
    before(:all) do
      @option_type = OptionType.new(:name => 'test_option_type')

      I18n.locale = 'en-US'
      @option_type.presentation = 'english presentation'   

      I18n.locale = 'pt-BR'
      @option_type.presentation = 'apresentação em português'
    end


    describe " should translate the presentation" do
      it 'to en_US' do
        I18n.locale = 'en-US'
        @option_type.presentation.should eql 'english presentation'
      end
      
      it 'to pt-BR' do
        I18n.locale = 'pt-BR'
        @option_type.presentation.should eql 'apresentação em português'
      end
    end



  end
  
end