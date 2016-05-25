require_relative('../db/sql_runner')
require_relative('nation')
require_relative('event')


class TeamEventResult

  attr_reader(:id, :event_id, :gold_nation, :silver_nation, :bronze_nation)


  def initialize(options)

    @id = options['id'].to_i
    @event_id = options['event_id'].to_i
    @gold_nation = options['gold_nation'].to_i
    @silver_nation = options['silver_nation'].to_i
    @bronze_nation = options['bronze_nation'].to_i

  end



  def save

    sql = "INSERT INTO team_event_results (

                        event_id,
                        gold_nation,
                        silver_nation,
                        bronze_nation
          ) 

          VALUES (

                        #{@event_id},
                        #{@gold_nation},
                        #{@silver_nation},
                        #{@bronze_nation}
          ) 

          RETURNING *;"

    result = SqlRunner.run(sql).first

    return TeamEventResult.new(result)

  end



  def self.update(options)

    sql = "UPDATE team_event_results SET

                      event_id = #{options['event_id']},
                      gold_nation = #{options['gold_nation']},
                      silver_nation = #{options['silver_nation']},
                      bronze_nation = #{options['bronze_nation']}

                      WHERE id = #{options['id']};"

    SqlRunner.run(sql)

  end



  def self.all

    sql = "SELECT * FROM team_event_results;"

    return TeamEventResult.map_items(sql)

  end



  def self.delete(id)

    sql = "DELETE FROM team_event_results WHERE id = #{id};"

    SqlRunner.run(sql)

  end



  def self.delete_all

    sql = "DELETE FROM team_event_results;"

    SqlRunner.run(sql)

  end



  def team_gold_medal_winner

    sql = "SELECT * FROM nations WHERE id IN(SELECT gold_nation FROM team_event_results WHERE id = #{@id})"

    Nation.map_item(sql)

  end



  def self.gold_team_athletes(id)

    sql = "SELECT * FROM athletes WHERE id IN(SELECT athlete_id FROM participations WHERE event_id = #{id} AND athlete_id IN(SELECT id FROM athletes WHERE nation_id IN(SELECT gold_nation FROM team_event_results WHERE event_id = #{id})));"

    Athlete.map_items(sql)

  end



  def team_silver_medal_winner

    sql = "SELECT * FROM nations WHERE id IN(SELECT silver_nation FROM team_event_results WHERE id = #{@id})"

    Nation.map_item(sql)

  end



  def self.silver_team_athletes(id)

    sql = "SELECT * FROM athletes WHERE id IN(SELECT athlete_id FROM participations WHERE event_id = #{id} AND athlete_id IN(SELECT id FROM athletes WHERE nation_id IN(SELECT silver_nation FROM team_event_results WHERE event_id = #{id})));"

    Athlete.map_items(sql)

  end



  def team_bronze_medal_winner

    sql = "SELECT * FROM nations WHERE id IN(SELECT bronze_nation FROM team_event_results WHERE id = #{@id})"

    Nation.map_item(sql)

  end



  def self.bronze_team_athletes(id)

    sql = "SELECT * FROM athletes WHERE id IN(SELECT athlete_id FROM participations WHERE event_id = #{id} AND athlete_id IN(SELECT id FROM athletes WHERE nation_id IN(SELECT silver_nation FROM team_event_results WHERE event_id = #{id})));"

    Athlete.map_items(sql)

  end



  def event

    sql = "SELECT * FROM events WHERE id = #{@event_id}"

    Event.map_item(sql)

  end



  def self.find(id)

    sql = "SELECT * FROM team_event_results WHERE id = #{id}"

    return TeamEventResult.map_item(sql)

  end



  def self.map_items(sql)

    results = SqlRunner.run(sql)
    outcomes = results.map { |result| TeamEventResult.new(result) }
    return outcomes

  end



  def self.map_item(sql)

    result = TeamEventResult.map_items(sql)
    return result.first

  end





end