
require_relative('../db/sql_runner')
require_relative('./haunting')

class Customer

  attr_reader :id
  attr_accessor :name, :email_address

  def initialize(params)
    @name = params['name']
    @email_address = params['email_address']
    @id = params['id'].to_i
  end

  def save()
    sql = "INSERT INTO customers(name, email_address) VALUES ('#{@name}', '#{@email_address}' ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, email_address) = '#{@name}','#{@email_address}'"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM customers WHERE id = #{id}"
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM customers WHERE id = '#{id}'  "
    results = Customer.map_items(sql)
    return results.first()
  end

  def hauntings()
    sql = "SELECT * FROM hauntings WHERE customer_id = #{@id}"
    Haunting.map_items(sql)
  end


  def self.all()
    sql = "SELECT * FROM customers"
    Customer.map_items(sql)
  end

  def self.map_items(sql)
    customers = SqlRunner.run(sql)
    result = customers.map {|customer| Customer.new(customer)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
