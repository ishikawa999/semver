require 'spec_helper'
require_relative '../version'

describe 'Version' do
  describe '数字を渡したバージョンオブジェクトに対して番号を返す' do
    it "1,4,2を渡したバージョンオブジェクトに対して番号'1.4.2'を返す" do
      version = Version.new(1,4,2)
      expect(version.number).to eq '1.4.2'
    end
    it "2,5,3を渡したバージョンオブジェクトに対して番号'2.5.3'を返す" do
      version = Version.new(2,5,3)
      expect(version.number).to eq '2.5.3'
    end
  end
end
