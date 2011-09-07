class User
  attr_reader :id
  attr_accessor :email, :password

  def initialize
    @id = 1
    @email = "metoo@aol.com"
    @password = "penguins"
  end

  def self.get(id)
    User.new  
  end

  def self.authenticate(email,password)
    User.new
  end
end
