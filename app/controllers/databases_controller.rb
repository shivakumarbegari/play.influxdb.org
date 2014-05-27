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

    if password.length < 3 || password.length > 36
      flash[:error] = "Passwords must be at least 4 characters long."
      render "new" and return
    end

    databases = @influxdb.get_database_list

    if databases.any? {|d| d["name"] == database}
      flash[:error] = "Database '#{database}' already exists."
      render "new" and return
    end

    @influxdb.create_database(database)
    @influxdb.create_database_user(database, username, password)

    redirect_to "http://sandbox.influxdb.com:8083/?username=#{username}&database=#{database}"
  end
end
