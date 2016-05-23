require_relative('../db/sql_runner')
require_relative('event')
require_relative('athlete')
require_relative('nation')


class Participation

  attr_accessor(:id, :athlete_id, :event_id)


  def initialize(options)

    @id = options['id']
    @athlete_id = options['athlete_id']
    @event_id = options['event_id']

  end



  def save

    sql = "INSERT INTO participations (athlete_id, event_id) VALUES (#{@athlete_id}, #{@event_id}) RETURNING *"

    participation = SqlRunner.run(sql).first

    return Participation.new(participation)

  end



  def self.all

    sql = "SELECT * FROM participations;"

    return Participation.map_items(sql)

  end



  def self.update(options)  # must enter ALL options to update

    sql = "UPDATE participations SET 

                        athlete_id = #{options['athlete_id']},
                        event_id = #{options['event_id']}

                        WHERE athlete_id = #{@athlete_id} AND
                              event_id = #{@event_id}"

    SqlRunner.run(sql)

  end



  def self.delete(athlete_id, event_id)

    sql = "DELETE FROM participations WHERE athlete_id = #{athlete_id} AND event_id = #{event_id};"

    SqlRunner.run(sql)

  end



  def self.delete_all

    sql = "DELETE FROM participations;"

    SqlRunner.run(sql)

  end



  def self.find(athlete_id, event_id)

    sql = "SELECT * FROM participations WHERE athlete_id = #{athlete_id} AND event_id = #{event_id}"

    return Participation.map_item(sql)

  end



  # def self.events

  #   sql = "SELECT * FROM events WHERE id = #{@event_id}"

  #   return Event.map_items(sql)

  # end



  def self.athletes_at_event(event_id)

    sql = "SELECT * FROM athletes WHERE id IN(SELECT athlete_id FROM participations WHERE event_id = #{event_id}) ORDER BY last_name ASC;"

    return Athlete.map_items(sql)

  end



  def athlete

    sql = "SELECT * FROM athletes WHERE id = #{@athlete_id}"

    return Athlete.map_item(sql)

  end



  def event

    sql = "SELECT * FROM events WHERE id = #{event_id}"

    return Event.map_item(sql)

  end



  def self.nations(event_id)

    sql = "SELECT * FROM nations WHERE id IN(SELECT nation_id FROM athletes WHERE id IN(SELECT athlete_id FROM participations WHERE event_id = #{event_id})) ORDER BY nation_name ASC;"

    return Nation.map_items(sql)

  end



  def self.national_athletes(event_id, nation_id)

    sql = "SELECT * FROM athletes WHERE nation_id = #{nation_id} AND id IN(SELECT athlete_id FROM participations WHERE event_id = #{event_id}) ORDER BY last_name ASC;"

    return Athlete.map_items(sql)

  end



  def self.map_items(sql)

    participations = SqlRunner.run(sql)
    result = participations.map { |participation| Participation.new( participation ) }
    return result

  end



  def self.map_item(sql)

    result = Participation.map_items(sql)
    return result.first

  end






end