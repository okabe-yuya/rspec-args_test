class SyncRequest
  def initialize(table_name, column_name, value, options)
    @table_name = table_name
    @column_name = column_name
    @value = value
    @options = options
  end

  def exec
    # do something...
    puts 'exec!'
  end
end