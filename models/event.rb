require_relative('../db/sql_runner')


class Event

  attr_accessor(:id, :event_name, :is_team)


  def initialize(options)

    @id = options['id'].to_i
    @event_name = options['event_name']
    @is_team = options['is_team']

  end



  def save

    sql = "INSERT INTO events (event_name, is_team) VALUES ('#{@event_name}', #{@is_team}) RETURNING *"

    event = SqlRunner.run(sql).first

    return Event.new(event)

  end



  def self.all

    sql = "SELECT * FROM events ORDER BY event_name ASC;"

    return Event.map_items(sql)

  end



  def self.update(options)

    sql = "UPDATE events SET 

                        event_name  = '#{options['event_name']}',
                        is_team     = #{options['is_team']}
                      
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



  def self.find(id)

    sql = "SELECT * FROM events WHERE id = #{id}"

    return Event.map_item(sql)

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