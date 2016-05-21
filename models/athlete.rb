require_relative('../db/sql_runner')


class Athlete

  attr_accessor(:id, :last_name, :first_name, :nation_id)


  def initialize(options)

    @id = options['id'].to_i
    @last_name = options['last_name']
    @first_name = options['first_name']
    @nation_id = options['nation_id'].to_i

  end



  def save

    sql = "INSERT INTO athletes (last_name, first_name, nation_id) VALUES ('#{@last_name}', '#{@first_name}', #{@nation_id}) RETURNING *"

    athlete = SqlRunner.run(sql).first

    return Athlete.new(athlete)

  end



  def self.all

    sql = "SELECT * FROM athletes;"

    return Athlete.map_items(sql)

  end



  def self.update(options)  # must enter ALL options to update

    sql = "UPDATE athletes SET 

                        last_name = '#{options['last_name']}',           
                        first_name = '#{options['first_name']}',
                        nation_id = #{options['nation_id']} 

                        WHERE id = #{options['id']};"

    SqlRunner.run(sql)

  end



  def self.delete(id)

    sql = "DELETE FROM athletes WHERE id = #{id};"

    SqlRunner.run(sql)

  end



  def self.delete_all

    sql = "DELETE FROM athletes;"

    SqlRunner.run(sql)

  end



  def self.map_items(sql)

    athletes = SqlRunner.run(sql)
    result = athletes.map { |athlete| Athlete.new( athlete ) }
    return result

  end



  def self.map_item(sql)

    result = Athlete.map_items(sql)
    return result.first

  end


















end