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



  def self.nations_sorted_by_points

    nations = Nation.all

    sorted = nations.sort_by! {|nation| Analysis.nation_points(nation.id)}

    return sorted.reverse

  end



  def self.nation_rankings

    nations = Nation.all

    points_array = []

    nations.each do |nation|

      points_array << [Analysis.nation_points(nation.id)]

    end

    sorted_points = points_array.sort.uniq.reverse

    unsorted_rankings = points_array.map{|a| sorted_points.index(a) + 1}

    sorted_rankings = unsorted_rankings.sort

    return sorted_rankings

  end




  def self.nation_table_rows

    nations = Analysis.nations_sorted_by_points
    rankings = Analysis.nation_rankings
    table_rows = []



    for nation in nations

      table_rows << [rankings[nations.index(nation)], nation.nation_name, Analysis.nation_total_golds(nation.id), Analysis.nation_total_silvers(nation.id), Analysis.nation_total_bronzes(nation.id), Analysis.nation_points(nation.id), nation.id]

    end

    return table_rows

  end





















end