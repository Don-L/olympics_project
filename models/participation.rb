require_relative('../db/sql_runner')


class Participation

  attr_accessor(:athlete_id, :event_id)


  def initialize(options)

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



  def update(options)  # must enter ALL options to update

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