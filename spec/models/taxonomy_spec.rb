# encoding: UTF-8
require 'spec_helper'

describe Taxonomy do
  describe 'translation system' do
    before(:all) do
      I18n.locale = 'en-US'
      @taxonomy = Taxonomy.new(:name => 'english name')                         

      I18n.locale = 'pt-BR'
      @taxonomy.name = 'nome em português'
    end


    describe " should translate the presentation" do
      it 'to en_US' do
        I18n.locale = 'en-US'
        @taxonomy.name.should eql 'english name'
      end
      
      it 'to pt-BR' do
        I18n.locale = 'pt-BR'
        @taxonomy.name.should eql 'nome em português'
      end
    end



  end
  
end