class Database
  attr_accessor :username, :password, :name

  def initialize(params = {})
    self.username = params[:username]
    self.password = params[:password]
    self.name = params[:name]
  end
end
