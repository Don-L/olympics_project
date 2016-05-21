require_relative('../db/sql_runner')


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