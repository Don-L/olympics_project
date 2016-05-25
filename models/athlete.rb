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

    sql = "SELECT * FROM athletes ORDER BY last_name ASC;"

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


  def self.find(id)

    sql = "SELECT * FROM athletes WHERE id = #{id}"

    return Athlete.map_item(sql)

  end



  def pretty_name

    pretty_name = @first_name + ' ' + @last_name
    return pretty_name

  end



  def formal_name

    formal_name = @last_name + ', ' + @first_name
    return formal_name

  end



  def nation

    sql = "SELECT * FROM nations WHERE id = #{@nation_id}"

    return Nation.map_item(sql)

  end



  def events

    sql = "SELECT * FROM events WHERE id IN(SELECT event_id FROM participations WHERE athlete_id = #{@id})"

    return Event.map_items(sql)

  end



  def participation(event_id)

    sql = "SELECT * FROM participations WHERE athlete_id = #{@id} AND event_id = #{event_id}"

    return Participation.map_item(sql)

  end



  def self.team_golds(id, nation_id)

    sql = "SELECT * FROM team_event_results WHERE gold_nation = #{nation_id} AND event_id IN(SELECT event_id FROM participations WHERE athlete_id = #{id});"

    return TeamEventResult.map_items(sql)

  end


  def self.team_silvers(id, nation_id)

    sql = "SELECT * FROM team_event_results WHERE silver_nation = #{nation_id} AND event_id IN(SELECT event_id FROM participations WHERE athlete_id = #{id})"

    return TeamEventResult.map_items(sql)

  end

  def self.team_bronzes(id, nation_id)

    sql = "SELECT * FROM team_event_results WHERE bronze_nation = #{nation_id} AND event_id IN(SELECT event_id FROM participations WHERE athlete_id = #{id})"

    return TeamEventResult.map_items(sql)

  end



  def self.ind_golds(id)

    sql = "SELECT * FROM individual_event_results WHERE gold_athlete = #{id}"

    return IndividualEventResult.map_items(sql)

  end

  def self.ind_silvers(id)

    sql = "SELECT * FROM individual_event_results WHERE silver_athlete = #{id}"

    return IndividualEventResult.map_items(sql)

  end

  def self.ind_bronzes(id)

    sql = "SELECT * FROM individual_event_results WHERE bronze_athlete = #{id}"

    return IndividualEventResult.map_items(sql)

  end



  def self.all_golds(id, nation_id)

    total_golds = Athlete.team_golds(id, nation_id) + Athlete.ind_golds(id)

    return total_golds.flatten.sort_by {|result| result.event.event_name}

  end

  def self.all_silvers(id, nation_id)

    total_silvers = Athlete.team_silvers(id, nation_id) + Athlete.ind_silvers(id)

    return total_silvers.flatten.sort_by {|result| result.event.event_name}

  end

  def self.all_bronzes(id, nation_id)

    total_bronzes = Athlete.team_bronzes(id, nation_id) + Athlete.ind_bronzes(id)

    return total_bronzes.flatten.sort_by {|result| result.event.event_name}

  end

  def number_of_golds

    Athlete.all_golds(@id, @nation_id).length

  end

  def number_of_silvers

    Athlete.all_silvers(@id, @nation_id).length

  end

  def number_of_bronzes

    Athlete.all_bronzes(@id, @nation_id).length

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