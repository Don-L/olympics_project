require('pry-byebug')
require_relative('athlete')
require_relative('event')
require_relative('individual_event_result')
require_relative('team_event_result')
require_relative('nation')
require_relative('participation')
require_relative('../db/sql_runner')



class Analysis


  def self.ind_event_golds(nation_id)

    sql = "SELECT * FROM individual_event_results WHERE gold_athlete IN(SELECT id FROM athletes WHERE nation_id = #{nation_id});"

    return IndividualEventResult.map_items(sql)

  end



  def self.ind_event_silvers(nation_id)

    sql = "SELECT * FROM individual_event_results WHERE silver_athlete IN(SELECT id FROM athletes WHERE nation_id = #{nation_id});"

    return IndividualEventResult.map_items(sql)

  end



  def self.ind_event_bronzes(nation_id)

    sql = "SELECT * FROM individual_event_results WHERE bronze_athlete IN(SELECT id FROM athletes WHERE nation_id = #{nation_id});"

    return IndividualEventResult.map_items(sql)

  end



  def self.team_event_golds(nation_id)

    sql = "SELECT * FROM team_event_results WHERE gold_nation = #{nation_id};"

    return TeamEventResult.map_items(sql)

  end



  def self.team_event_silvers(nation_id)

    sql = "SELECT * FROM team_event_results WHERE silver_nation = #{nation_id};"

    return TeamEventResult.map_items(sql)

  end



  def self.team_event_bronzes(nation_id)

    sql = "SELECT * FROM team_event_results WHERE bronze_nation = #{nation_id};"

    return TeamEventResult.map_items(sql)

  end



  def self.nation_total_golds(nation_id)

    gold_wins = Analysis.ind_event_golds(nation_id) + Analysis.team_event_golds(nation_id)

    return gold_wins.length

  end



  def self.nation_total_silvers(nation_id)

    silver_wins = Analysis.ind_event_silvers(nation_id) + Analysis.team_event_silvers(nation_id)

    return silver_wins.length

  end



  def self.nation_total_bronzes(nation_id)

    bronze_wins = Analysis.ind_event_bronzes(nation_id) + Analysis.team_event_bronzes(nation_id)

    return bronze_wins.length

  end





  def self.nation_points(nation_id)

    golds = Analysis.nation_total_golds(nation_id) 

    silvers = Analysis.nation_total_silvers(nation_id)

    bronzes = Analysis.nation_total_bronzes(nation_id)

    points = 5*golds + 3*silvers + bronzes

    return points

  end



  # def self.nation_table_rows

  #   nations = Nation.all
  #   table_rows = []

  #   for nation in nations

  #     table_rows << [nation.nation_name, Analysis.nation_total_golds(nation.id), Analysis.nation_total_silvers(nation.id), Analysis.nation_total_bronzes(nation.id), Analysis.nation_points(nation.id)]

  #   end

  #   return table_rows

  # end

  def sel.nation_table_rows

    rankings = Analysis.nation_rankings

  end



  def self.nation_rankings



    nations = Nation.all

    points_and_nations = []

    nations.each do |nation|

      points_and_nations << [Analysis.nation_points(nation.id), nation]

    end

    points_and_nations = points_and_nations.sort.reverse

    points_and_nations.each do |pair|

      if pair[0] != points_and_nations[points_and_nations.index(pair)-1][0]

        ranking = points_and_nations.index(pair) + 1

        pair << ranking

      else ranking = points_and_nations[points_and_nations.index(pair)-1][2]

        pair << ranking

      end

      for triplets in points_and_nations

        triplets.reverse.pop.pop

      end

      return points_and_nations.flatten

  end


  # get the sorted array of nations and points, 
  # eg [[3,france],[2,germany],[2,britain],[1,usa]]

  # check to see if france's points = the points of the previous array entry. they don't, so france's ranking is index + 1

  # check to see if germany's points = frances points. they don,t so germany's ranking is index+1

  # check to see if britain's points = germany's points. they do, so britain's ranking = germany's ranking'

























end