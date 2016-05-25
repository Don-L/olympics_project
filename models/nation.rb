require_relative('../db/sql_runner')


class Nation

  attr_accessor(:id, :nation_name)


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

    sql = "SELECT * FROM nations ORDER BY nation_name ASC;"

    return Nation.map_items(sql)

  end



  def self.update(options)

    sql = "UPDATE nations SET nation_name = '#{options['nation_name']}' WHERE id = #{options['id']}"

    SqlRunner.run(sql)

  end



  def self.delete(id)

    sql = "DELETE FROM nations WHERE id = #{id};"

    SqlRunner.run(sql)

  end



  def self.delete_all

    sql = "DELETE FROM nations;"

    SqlRunner.run(sql)

  end



  def self.find(id)

    sql = "SELECT * FROM nations WHERE id = #{id}"

    return Nation.map_item(sql)

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



  def self.team_gold_results(id)

    sql = "SELECT * FROM team_event_results WHERE gold_nation = #{id}"

    return TeamEventResult.map_items(sql)

  end



  def self.team_silver_results(id)

    sql = "SELECT * FROM team_event_results WHERE silver_nation = #{id}"

    return TeamEventResult.map_items(sql)

  end



  def self.team_bronze_results(id)

    sql = "SELECT * FROM team_event_results WHERE bronze_nation = #{id}"

    return TeamEventResult.map_items(sql)

  end



  def self.individual_gold_results(id)

    sql = "SELECT * FROM individual_event_results WHERE gold_athlete IN(SELECT id FROM athletes WHERE nation_id = #{id})"

    return IndividualEventResult.map_items(sql)

  end



  def self.individual_silver_results(id)

    sql = "SELECT * FROM individual_event_results WHERE silver_athlete IN(SELECT id FROM athletes WHERE nation_id = #{id})"

    return IndividualEventResult.map_items(sql)

  end



  def self.individual_bronze_results(id)

    sql = "SELECT * FROM individual_event_results WHERE bronze_athlete IN(SELECT id FROM athletes WHERE nation_id = #{id})"

    return IndividualEventResult.map_items(sql)

  end



  def self.all_gold_results(id)

    results = Nation.team_gold_results(id) + Nation.individual_gold_results(id)

    return results.flatten.sort_by! {|result| result.event.event_name}

  end


  def number_of_golds

    Nation.all_gold_results(@id).length

  end



  def self.all_silver_results(id)

    results = Nation.team_silver_results(id) + Nation.individual_silver_results(id)

    return results.flatten.sort_by! {|result| result.event.event_name}

  end



  def number_of_silvers

    Nation.all_silver_results(@id).length

  end



  def self.all_bronze_results(id)

    results = Nation.team_bronze_results(id) + Nation.individual_bronze_results(id)

    return results.flatten.sort_by! {|result| result.event.event_name}

  end



  def number_of_bronzes

    Nation.all_bronze_results(@id).length

  end



  def won_golds?

    if Nation.all_gold_results(@id).length > 0
      return true
    else
      return false
    end

  end



  def won_silvers?

    if Nation.all_silver_results(@id).length > 0
      return true
    else
      return false
    end

  end



  def won_bronzes?

    if Nation.all_bronze_results(@id).length > 0
      return true
    else
      return false
    end

  end



  def self.all_events(id)

    sql = "SELECT * FROM events WHERE id IN(SELECT event_id FROM participations WHERE athlete_id IN(SELECT id FROM athletes WHERE nation_id = #{id}))"

    return Event.map_items(sql).sort_by! {|event| event.event_name}

  end



  def self.all_athletes(id)

    sql = "SELECT * FROM athletes WHERE nation_id = #{id}"

    return Athlete.map_items(sql).sort_by {|athlete| athlete.last_name}

  end


















end