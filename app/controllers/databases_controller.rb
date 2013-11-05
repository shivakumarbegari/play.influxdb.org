class DatabasesController < ApplicationController
  def new
  end

  def create
    username = params[:database][:username]
    password = params[:database][:password]
    database = params[:database][:name]

    @influxdb = InfluxDB::Client.new("sandbox.influxdb.org", 9061, "root", ENV["INFLUXDB_ROOT_PASSWORD"], nil)
    @influxdb.create_database_user(database, username, password)

    redirect_to "http://sandbox.influxdb.org:9062/#/?username=#{username}&password=#{password}&database=#{database}"
  end
end
