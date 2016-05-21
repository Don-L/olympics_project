require('pry-byebug')
require_relative('../models/nation')
require_relative('../models/athlete')
require_relative('../models/event')
require_relative('../models/participation')


Nation.delete_all
Athlete.delete_all
Event.delete_all
Participation.delete_all

nation1 = Nation.new({'nation_name' => 'France'})
nation2 = Nation.new({'nation_name' => 'Belgium'})

n1 = nation1.save
n2 = nation2.save

nn = Nation.all

athlete1 = Athlete.new({'last_name' => 'Lemaitre', 'first_name' => 'Christophe', 'nation_id' => n1.id})
athlete2 = Athlete.new({'last_name' => 'Boonen', 'first_name' => 'Tom', 'nation_id' => n2.id})

a1 = athlete1.save
a2 = athlete2.save

aa = Athlete.all

# Athlete.update({'id' => a1.id, 'first_name' => 'Jimmy', 'last_name' => 'Riddle', 'nation_id' => 53})

event1 = Event.new({'event_name' => "Men - Long Jump", 'is_team' => false})
event2 = Event.new({'event_name' => "Men - Rugby Sevens", 'is_team' => true})

e1 = event1.save
e2 = event2.save

participation1 = Participation.new({'athlete_id' => a1.id, 'event_id' => e1.id})
participation2 = Participation.new({'athlete_id' => a1.id, 'event_id' => a2.id})

p1 = participation1.save
p2 = participation2.save

pp = Participation.all

# p1.update({'athlete_id' => a2.id, 'event_id' => e1.id})



# Event.update({'id' => 1, 'event_name' => e1.event_name, 'is_team' => 'true', 'a_gold_id' => \N, 'a_silver_id' => e1.a_silver_id, 'a_bronze_id' => e1.a_bronze_id, 't_gold_id' => e1.t_gold_id, 't_silver_id' => e1.t_silver_id, 't_bronze_id' => e1.t_bronze_id})

# Event.update({ 'id' => 1, 'event_name' => e1.event_name, 'is_team' => 'false', 'a_gold_id' => 1, 'a_silver_id' => 'null', 'a_bronze_id' => 'null', 't_gold_id' => 'null', 't_silver_id' => 'null', 't_bronze_id' => 'null'})

binding.pry
nil
