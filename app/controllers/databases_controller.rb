class DatabasesController < ApplicationController
  def new
    @database = Database.new
  end

  def create
    @database = Database.new(params[:database])
    username = params[:database][:username]
    password = params[:database][:password]
    database = params[:database][:name]

    @influxdb = InfluxDB::Client.new host: INFLUXDB_HOST,
                                     port: INFLUXDB_PORT,
                                     username: INFLUXDB_USERNAME,
                                     password: INFLUXDB_PASSWORD

    if username.blank? || password.blank? || database.blank?
      flash[:error] = "All fields are required."
      render "new" and return
    end

    databases = JSON.parse(@influxdb.get_database_list.body)

    if databases.any? {|d| d["name"] == database}
      flash[:error] = "Database '#{database}' already exists."
      render "new" and return
    end

    @influxdb.create_database_user(database, username, password)

    redirect_to "http://sandbox.influxdb.org:9062/#/?username=#{username}&database=#{database}"
  end
end
