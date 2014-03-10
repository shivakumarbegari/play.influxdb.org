INFLUXDB_ADMIN_USER = "root"
INFLUXDB_ADMIN_PASS = "root"

InfluxDB::Rails.configure do |config|
  config.influxdb_database = "influxdb-rails"
  config.influxdb_username = "root"
  config.influxdb_password = ENV["INFLUXDB_ROOT_PASSWORD"]
  config.influxdb_host = "sandbox.influxdb.com"
  config.influxdb_port = "8086"
end
