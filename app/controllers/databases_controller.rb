class DatabasesController < ApplicationController
  def new
  end

  def create
    username = params[:database][:username]
    password = params[:database][:password]
    database = params[:database][:name]

    @influxdb = InfluxDB::Client.new("sandbox.influxdb.org", 9061, "root", "root", nil)
    @influxdb.create_database_user(database, username, password)
  end
end
