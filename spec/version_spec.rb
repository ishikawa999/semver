require 'spec_helper'
require_relative '../version'

describe 'Version' do
  let(:version_1_4_2) { Version.new(1,4,2) }
  describe '数字を渡したバージョンオブジェクトに対して番号を返す' do
    it "1,4,2を渡したバージョンオブジェクトに対して番号'1.4.2'を返す" do
      expect(version_1_4_2.number).to eq '1.4.2'
    end
    # it "2,5,3を渡したバージョンオブジェクトに対して番号'2.5.3'を返す" do
    #   version = Version.new(2,5,3)
    #   expect(version.number).to eq '2.5.3'
    # end
  end

  describe '等価性チェックをする' do
    context 'バージョンAはバージョンBと等しくない場合はfalseを返す' do
      it 'バージョン1.4.2はバージョン2.1.0と等しくない場合はfalseを返す' do
        expect(version_1_4_2 == Version.new(2,1,0)).to be false
      end
    end
    context 'バージョンAはバージョンAと等しい場合はtrueを返す' do
      it 'バージョン1.4.2はバージョン1.4.2と等しい場合はtrueを返す' do
        expect(version_1_4_2 == Version.new(1,4,2)).to be true
      end
    end
  end
end
