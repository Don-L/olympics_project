require('pry-byebug')
require_relative('../db/sql_runner')
require_relative('nation')
require_relative('athlete')
require_relative('individual_event_result')
require_relative('team_event_result')


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



  def self.all_team

    sql = "SELECT * FROM events WHERE is_team = 't' ORDER BY event_name ASC"

    return Event.map_items(sql)

  end



  def self.all_individual

    sql = "SELECT * FROM events WHERE is_team = 'f' ORDER BY event_name ASC"

    return Event.map_items(sql)

  end



  def self.update(options)

    sql = "UPDATE events SET 

                        event_name  = '#{options['event_name']}',
                        is_team     = #{options['is_team']}
                      
                        WHERE id = #{options['id']};"

    SqlRunner.run(sql)

  end



  def has_result?

    if @is_team == 't'

      sql = "SELECT * FROM team_event_results WHERE event_id = #{@id}"

      result = TeamEventResult.map_items(sql)

      if result.length == 0

        return false

      else return true

      end

    elsif @is_team == 'f'

      sql = "SELECT * FROM individual_event_results WHERE event_id = #{@id}"

      result = IndividualEventResult.map_items(sql)

      if result.length == 0

        return false

      else return true

      end

    end

  end

  # def self.unresolved_team_events

  #   all_events = Event.all
  #   resolved_event_ids = []
  #   TeamEventResult.all.each do |result|
  #     resolved_event_ids << result.event_id
  #   end
  #   event_ids 
  #   unresolved_team_events = []
    
  #     if 


  # end



  def self.competing_nations(id)

    sql = "SELECT * FROM nations WHERE id IN(SELECT nation_id FROM athletes WHERE id IN(SELECT athlete_id FROM participations WHERE event_id = #{id})) ORDER BY nation_name ASC"

    return Nation.map_items(sql)

  end



  def result

    if @is_team == 't'

      sql = "SELECT * from team_event_results WHERE event_id = #{@id}"

      result = TeamEventResult.map_item(sql)

    elsif @is_team == 'f'

      sql = "SELECT * from individual_event_results WHERE event_id = #{@id}"

      result = IndividualEventResult.map_item(sql)

    end

    return result

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