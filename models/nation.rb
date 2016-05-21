require_relative('../db/sql_runner')


class Nation

  attr_reader(:id, :nation_name)


  def initialize(options)

    @id = options['id'].to_i
    @nation_name = options['nation_name']

  end



  def save

    sql = "INSERT INTO nations (nation_name) VALUES ('#{@nation_name}') RETURNING *"

    nation = SqlRunner.run(sql).first

    return Nation.new(nation)

  end



  def self.all

    sql = "SELECT * FROM nations;"

    return Nation.map_items(sql)

  end



  def self.delete(id)

    sql = "DELETE FROM nations WHERE id = #{id};"

    SqlRunner.run(sql)

  end



  def self.delete_all

    sql = "DELETE FROM nations;"

    SqlRunner.run(sql)

  end



  def self.map_items(sql)

    nations = SqlRunner.run(sql)
    result = nations.map { |nation| Nation.new( nation ) }
    return result

  end



  def self.map_item(sql)

    result = Nation.map_items(sql)
    return result.first

  end


















end