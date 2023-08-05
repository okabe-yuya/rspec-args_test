require 'sync_request'

class SyncController < ApplicationController
  def create
    options = { option_a: true, option_b: false }
    ins = SyncRequest.new(
      permitted_params[:table_name],
      permitted_params[:column_name],
      permitted_params[:value],
      options,
    )

    ins.exec
    render status: :ok, json: {}
  end

  def permitted_params
    params.permit(:table_name, :column_name, :value)
  end
end
