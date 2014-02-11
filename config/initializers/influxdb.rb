INFLUXDB_ADMIN_USER = "root"
INFLUXDB_ADMIN_PASS = "root"

InfluxDB::Rails.configure do |config|
  config.influxdb_database = "influxdb-rails"
  config.influxdb_username = "influxdb"
  config.influxdb_password = "3rrpl4n3!"
  config.influxdb_host = "sandbox.influxdb.org"
  config.influxdb_port = "9061"
end
