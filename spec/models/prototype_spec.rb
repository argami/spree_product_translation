# encoding: UTF-8
require 'spec_helper'

describe Prototype do
  describe 'translation system' do
    before(:all) do
      I18n.locale = 'en-US'
      @prototype = Prototype.new(:name => 'english name')                         

      I18n.locale = 'pt-BR'
      @prototype.name = 'nome em português'
    end


    describe " should translate the presentation" do
      it 'to en_US' do
        I18n.locale = 'en-US'
        @prototype.name.should eql 'english name'
      end
      
      it 'to pt-BR' do
        I18n.locale = 'pt-BR'
        @prototype.name.should eql 'nome em português'
      end
    end
  end
  
end