require_relative('../db/sql_runner')


class Event

  attr_accessor(:id, :event_name, :is_team, :a_gold_id, :a_silver_id, :a_bronze_id, :t_gold_id, :t_silver_id, :t_bronze_id)


  def initialize(options)

    @id = options['id'].to_i
    @event_name = options['event_name']
    @is_team = options['is_team']
    @a_gold_id = options['a_gold_id'].to_i
    @a_silver_id = options['a_silver_id'].to_i
    @a_bronze_id = options['a_bronze_id'].to_i
    @t_gold_id = options['t_gold_id'].to_i
    @t_silver_id = options['t_silver_id'].to_i
    @t_bronze_id = options['t_bronze_id'].to_i

  end



  def save

    sql = "INSERT INTO events (event_name, is_team) VALUES ('#{@event_name}', #{@is_team}) RETURNING *"

    event = SqlRunner.run(sql).first

    return Event.new(event)

  end



  def self.all

    sql = "SELECT * FROM events;"

    return Event.map_items(sql)

  end



  def self.update(options)  # must enter ALL options to update

    sql = "UPDATE events SET 

                        event_name = '#{options['event_name']}',           
                        is_team = '#{options['is_team']}',
                        a_gold_id = #{options['a_gold_id']},
                        a_silver_id = #{options['a_silver_id']},
                        a_bronze_id = #{options['a_bronze_id']},
                        t_gold_id = #{options['t_gold_id']},
                        t_silver_id = #{options['t_silver_id']},
                        t_bronze_id = #{options['t_bronze_id']}

                        WHERE id = #{options['id']};"

    SqlRunner.run(sql)

  end



  def self.delete(id)

    sql = "DELETE FROM events WHERE id = #{id};"

    SqlRunner.run(sql)

  end



  def self.delete_all

    sql = "DELETE FROM events;"

    SqlRunner.run(sql)

  end



  def self.map_items(sql)

    events = SqlRunner.run(sql)
    result = events.map { |event| Event.new( event ) }
    return result

  end



  def self.map_item(sql)

    result = Event.map_items(sql)
    return result.first

  end






end