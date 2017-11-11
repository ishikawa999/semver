require 'spec_helper'
require_relative '../version'

describe 'Version' do
  let(:version_1_4_2) { Version.new(1,4,2) }
  describe '数字を渡したバージョンオブジェクトに対して番号を返す' do
    it "1,4,2を渡したバージョンオブジェクトに対して番号'1.4.2'を返す" do
      expect(version_1_4_2.number).to eq '1.4.2'
    end
    it "2,5,3を渡したバージョンオブジェクトに対して番号'2.5.3'を返す" do
      version = Version.new(2,5,3)
      expect(version.number).to eq '2.5.3'
    end
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

  describe 'major, minor, patch がゼロ、または正の整数以外のものが与えた場合例外が発生する' do
    context '許可しない値の場合' do
      context 'マイナスの場合エラー' do
        it 'バージョンオブジェクト生成時に major に -1 を与えると例外が発生する' do
          expect{ Version.new(-1,1,1) }.to raise_error(ArgumentError, "majorは不正な値です。")
        end
        it 'バージョンオブジェクト生成時に minor に -1 を与えると例外が発生する' do
          expect{ Version.new(1,-1,1) }.to raise_error(ArgumentError, "minorは不正な値です。")
        end
        it 'バージョンオブジェクト生成時に patch に -1 を与えると例外が発生する' do
          expect{ Version.new(1,1,-1) }.to raise_error(ArgumentError, "patchは不正な値です。")
        end
      end
      context '文字列の場合エラー' do
        it 'バージョンオブジェクト生成時に major に "1" を与えると例外が発生する' do
          expect{ Version.new("1",1,1) }.to raise_error(ArgumentError, "majorは不正な値です。")
        end
        it 'バージョンオブジェクト生成時に minor に "1" を与えると例外が発生する' do
          expect{ Version.new(1,"1",1) }.to raise_error(ArgumentError, "minorは不正な値です。")
        end
        it 'バージョンオブジェクト生成時に patch に "1" を与えると例外が発生する' do
          expect{ Version.new(1,1,"1") }.to raise_error(ArgumentError, "patchは不正な値です。")
        end
      end
      context 'nilの場合エラー' do
        it 'バージョンオブジェクト生成時に major に nil を与えると例外が発生する' do
          expect{ Version.new(nil,1,1) }.to raise_error(ArgumentError, "majorは不正な値です。")
        end
        it 'バージョンオブジェクト生成時に minor に nil を与えると例外が発生する' do
          expect{ Version.new(1,nil,1) }.to raise_error(ArgumentError, "minorは不正な値です。")
        end
        it 'バージョンオブジェクト生成時に patch に nil を与えると例外が発生する' do
          expect{ Version.new(1,1,nil) }.to raise_error(ArgumentError, "patchは不正な値です。")
        end
      end
    end
    context '許可する値の場合' do
      it 'バージョンオブジェクト生成時に major に 0 を与えると例外が発生しない' do
        expect{ Version.new(0,1,1) }.not_to raise_error
      end
      it 'バージョンオブジェクト生成時に minor に 0 を与えると例外が発生しない' do
        expect{ Version.new(1,0,1) }.not_to raise_error
      end
      it 'バージョンオブジェクト生成時に patch に 0 を与えると例外が発生しない' do
        expect{ Version.new(1,1,0) }.not_to raise_error
      end
    end
  end
end
