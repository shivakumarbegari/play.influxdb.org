class Api::UsersController < ApiController
  def create
    influxdb = InfluxDB.new(
      "sandbox.influxdb.org",
      9061,
      INFLUXDB_ADMIN_USER,
      INFLUXDB_ADMIN_PASS,
      database
    )

    database = params[:database]
    username = params[:username]
    password = params[:password]

    response = influxdb.create_database_user(database, username, password)
  end
end
