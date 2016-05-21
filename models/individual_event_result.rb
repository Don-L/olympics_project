require_relative('../db/sql_runner')


class IndividualEventResult

  attr_reader(:id, :event_id, :gold_athlete, :silver_athlete, :bronze_athlete)


  def initialize(options)

    @id = options['id'].to_i
    @event_id = options['event_id'].to_i
    @gold_athlete = options['gold_athlete'].to_i
    @silver_athlete = options['silver_athlete'].to_i
    @bronze_athlete = options['bronze_athlete'].to_i

  end



  def save

    sql = "INSERT INTO individual_event_results (

                        event_id,
                        gold_athlete,
                        silver_athlete,
                        bronze_athlete
          ) 

          VALUES (

                        #{@event_id},
                        #{@gold_athlete},
                        #{@silver_athlete},
                        #{@bronze_athlete}
          ) 

          RETURNING *"

    result = SqlRunner.run(sql).first

    return IndividualEventResult.new(result)

  end



  def self.all

    sql = "SELECT * FROM individual_event_results;"

    return IndividualEventResult.map_items(sql)

  end



  def self.delete(id)

    sql = "DELETE FROM individual_event_results WHERE id = #{id};"

    SqlRunner.run(sql)

  end



  def self.delete_all

    sql = "DELETE FROM individual_event_results;"

    SqlRunner.run(sql)

  end



  def self.map_items(sql)

    results = SqlRunner.run(sql)
    outcomes = results.map { |result| IndividualEventResult.new(result) }
    return outcomes

  end



  def self.map_item(sql)

    result = IndividualEventResult.map_items(sql)
    return result.first

  end


















end