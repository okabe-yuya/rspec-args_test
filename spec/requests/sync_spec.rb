require 'rails_helper'
require 'sync_request'

RSpec.describe "SyncController", type: :request do
  describe 'POST: /sync' do
    let(:request_params) do
      {
        table_name: 'users',
        column_name: 'name',
        value: '有馬かな',
      }
    end

    context 'status' do
      it '成功時に200ステータスが返ること' do
        post sync_path, params: request_params
        expect(response.status).to eq 200
      end
    end

    context 'libの呼び出し' do
      it 'インスタンス作成時の引数に受け取ったパラメーターが指定されること' do
        orignal_method = SyncRequest.method(:new)
        allow(SyncRequest).to receive(:new) do |*args|
          expect(args.size).to eq 4
          expect(args[0]).to eq request_params[:table_name]
          expect(args[1]).to eq request_params[:column_name]
          expect(args[2]).to eq request_params[:value]
          expect(args[3].class).to eq Hash

          orignal_method.call(*args)
        end

        post sync_path, params: request_params
      end
    end
  end
end