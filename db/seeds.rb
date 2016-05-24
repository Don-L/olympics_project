require('pry-byebug')
require_relative('../models/nation')
require_relative('../models/athlete')
require_relative('../models/event')
require_relative('../models/participation')
require_relative('../models/individual_event_result')
require_relative('../models/team_event_result')


Nation.delete_all
Athlete.delete_all
Event.delete_all
Participation.delete_all
TeamEventResult.delete_all
IndividualEventResult.delete_all

nation1 = Nation.new({'nation_name' => 'France'})
nation2 = Nation.new({'nation_name' => 'Great Britain and Northern Ireland'})
nation3 = Nation.new({'nation_name' => 'Russia'})
nation4 = Nation.new({'nation_name' => 'Germany'})
nation5 = Nation.new({'nation_name' => 'United States of America'})

n1 = nation1.save
n2 = nation2.save
n3 = nation3.save
n4 = nation4.save
n5 = nation5.save


# nn = Nation.all

event1 = Event.new({'event_name' => "Men - Individual Road Race", 'is_team' => false})
event2 = Event.new({'event_name' => "Mixed Doubles", 'is_team' => true})
event3 = Event.new({'event_name' => "Men - 200 Metres", 'is_team' => false})
event4 = Event.new({'event_name' => "Men - Singles", 'is_team' => false})
event5 = Event.new({'event_name' => "Women - Singles", 'is_team' => false})
event6 = Event.new({'event_name' => "Women - 100 Metres", 'is_team' => false})
event7 = Event.new({'event_name' => "Dressage", 'is_team' => false})
event8 = Event.new({'event_name' => "Women - 100 Metres Freestyle", 'is_team' => false})

e1 = event1.save
e2 = event2.save
e3 = event3.save
e4 = event4.save
e5 = event5.save
e6 = event6.save
e7 = event7.save
e8 = event8.save

athlete1 = Athlete.new({'last_name' => 'Lemaitre', 'first_name' => 'Christophe', 'nation_id' => n1.id})
athlete2 = Athlete.new({'last_name' => 'Chavanel', 'first_name' => 'Sylvain', 'nation_id' => n1.id})
athlete3 = Athlete.new({'last_name' => 'Tsonga', 'first_name' => 'Jo-Wilfried', 'nation_id' => n1.id})
athlete4 = Athlete.new({'last_name' => 'Mang', 'first_name' => 'Veronique', 'nation_id' => n1.id})
athlete5 = Athlete.new({'last_name' => 'Michel', 'first_name' => 'Jessica', 'nation_id' => n1.id})
athlete6 = Athlete.new({'last_name' => 'Bonnet', 'first_name' => 'Charlotte', 'nation_id' => n1.id})



athlete7 = Athlete.new({'last_name' => 'Robson', 'first_name' => 'Laura', 'nation_id' => n2.id})
athlete8 = Athlete.new({'last_name' => 'Murray', 'first_name' => 'Andy', 'nation_id' => n2.id})
athlete9 = Athlete.new({'last_name' => 'Wiggins', 'first_name' => 'Bradley', 'nation_id' => n2.id})
athlete10 = Athlete.new({'last_name' => 'Oyepitan', 'first_name' => 'Abi', 'nation_id' => n2.id})
athlete11 = Athlete.new({'last_name' => 'Dujardin', 'first_name' => 'Charlotte', 'nation_id' => n2.id})
athlete12 = Athlete.new({'last_name' => 'Smith', 'first_name' => 'Amy', 'nation_id' => n2.id})



athlete13 = Athlete.new({'last_name' => 'Vesning', 'first_name' => 'Elena', 'nation_id' => n3.id})
athlete14 = Athlete.new({'last_name' => 'Youzhny', 'first_name' => 'Mikhail', 'nation_id' => n3.id})
athlete15 = Athlete.new({'last_name' => 'Kolobnev', 'first_name' => 'Alexandr', 'nation_id' => n3.id})
athlete16 = Athlete.new({'last_name' => 'Belkina', 'first_name' => 'Olga', 'nation_id' => n3.id})
athlete17 = Athlete.new({'last_name' => 'Nastenko', 'first_name' => 'Mikhail', 'nation_id' => n3.id})
athlete18 = Athlete.new({'last_name' => 'Popova', 'first_name' => 'Veronika', 'nation_id' => n3.id})



athlete19 = Athlete.new({'last_name' => 'Greipel', 'first_name' => 'Andre', 'nation_id' => n4.id})
athlete20 = Athlete.new({'last_name' => 'Kerber', 'first_name' => 'Angelique', 'nation_id' => n4.id})
athlete21 = Athlete.new({'last_name' => 'Petzchner', 'first_name' => 'Philipp', 'nation_id' => n4.id})
athlete22 = Athlete.new({'last_name' => 'Pinta', 'first_name' => 'Tatjana', 'nation_id' => n4.id})
athlete23 = Athlete.new({'last_name' => 'Langehanenberg', 'first_name' => 'Helen', 'nation_id' => n4.id})
athlete24 = Athlete.new({'last_name' => 'Schreiber', 'first_name' => 'Daniela', 'nation_id' => n4.id})



athlete25 = Athlete.new({'last_name' => 'Raymond', 'first_name' => 'Lisa', 'nation_id' => n5.id})
athlete26 = Athlete.new({'last_name' => 'Bryan', 'first_name' => 'Mike', 'nation_id' => n5.id})
athlete27 = Athlete.new({'last_name' => 'Farrar', 'first_name' => 'Tyler', 'nation_id' => n5.id})
athlete28 = Athlete.new({'last_name' => 'Jeter', 'first_name' => 'Carmelita', 'nation_id' => n5.id})
athlete29 = Athlete.new({'last_name' => 'Peters', 'first_name' => 'Steffen', 'nation_id' => n5.id})
athlete30 = Athlete.new({'last_name' => 'Franklin', 'first_name' => 'Missy', 'nation_id' => n5.id})



# athlete31 = Athlete.new({'last_name' => 'Boonen', 'first_name' => 'Tom', 'nation_id' => n6.id})
# athlete32 = Athlete.new({'last_name' => 'Boonen', 'first_name' => 'Tom', 'nation_id' => n6.id})
# athlete33 = Athlete.new({'last_name' => 'Boonen', 'first_name' => 'Tom', 'nation_id' => n6.id})
# athlete34 = Athlete.new({'last_name' => 'Boonen', 'first_name' => 'Tom', 'nation_id' => n6.id})
# athlete35 = Athlete.new({'last_name' => 'Boonen', 'first_name' => 'Tom', 'nation_id' => n6.id})
# athlete36 = Athlete.new({'last_name' => 'Boonen', 'first_name' => 'Tom', 'nation_id' => n6.id})

a1 = athlete1.save
a2 = athlete2.save
a3 = athlete3.save
a4 = athlete4.save
a5 = athlete5.save
a6 = athlete6.save
a7 = athlete7.save
a8 = athlete8.save
a9 = athlete9.save
a10 = athlete10.save
a11 = athlete11.save
a12 = athlete12.save
a13 = athlete13.save
a14 = athlete14.save
a15 = athlete15.save
a16 = athlete16.save
a17 = athlete17.save
a18 = athlete18.save
a19 = athlete19.save
a20 = athlete20.save
a21 = athlete21.save
a22 = athlete22.save
a23 = athlete23.save
a24 = athlete24.save
a25 = athlete25.save
a26 = athlete26.save
a27 = athlete27.save
a28 = athlete28.save
a29 = athlete29.save
a30 = athlete30.save
# a31 = athlete31.save
# a32 = athlete32.save
# a33 = athlete33.save
# a34 = athlete34.save
# a35 = athlete35.save
# a36 = athlete36.save


aa = Athlete.all

# Athlete.update({'id' => a1.id, 'first_name' => 'Jimmy', 'last_name' => 'Riddle', 'nation_id' => 53})
participation1 = Participation.new({'athlete_id' => a1.id, 'event_id' => e3.id})
participation2 = Participation.new({'athlete_id' => a2.id, 'event_id' => e1.id})
participation3 = Participation.new({'athlete_id' => a3.id, 'event_id' => e4.id})
participation4 = Participation.new({'athlete_id' => a4.id, 'event_id' => e6.id})
participation5 = Participation.new({'athlete_id' => a5.id, 'event_id' => e7.id})
participation6 = Participation.new({'athlete_id' => a6.id, 'event_id' => e8.id})
participation7 = Participation.new({'athlete_id' => a7.id, 'event_id' => e2.id})
participation8 = Participation.new({'athlete_id' => a7.id, 'event_id' => e5.id})
participation9 = Participation.new({'athlete_id' => a8.id, 'event_id' => e4.id})
participation10 = Participation.new({'athlete_id' => a8.id, 'event_id' => e2.id})
participation11 = Participation.new({'athlete_id' => a9.id, 'event_id' => e1.id})
participation12 = Participation.new({'athlete_id' => a10.id, 'event_id' => e6.id})
participation13 = Participation.new({'athlete_id' => a11.id, 'event_id' => e7.id})
participation14 = Participation.new({'athlete_id' => a12.id, 'event_id' => e8.id})
participation15 = Participation.new({'athlete_id' => a13.id, 'event_id' => e2.id})
participation16 = Participation.new({'athlete_id' => a13.id, 'event_id' => e5.id})
participation17 = Participation.new({'athlete_id' => a14.id, 'event_id' => e4.id})
participation18 = Participation.new({'athlete_id' => a14.id, 'event_id' => e2.id})
participation19 = Participation.new({'athlete_id' => a15.id, 'event_id' => e1.id})
participation20 = Participation.new({'athlete_id' => a16.id, 'event_id' => e6.id})
participation21 = Participation.new({'athlete_id' => a17.id, 'event_id' => e7.id})
participation22 = Participation.new({'athlete_id' => a18.id, 'event_id' => e8.id})
participation23 = Participation.new({'athlete_id' => a19.id, 'event_id' => e1.id})
participation24 = Participation.new({'athlete_id' => a20.id, 'event_id' => e2.id})
participation25 = Participation.new({'athlete_id' => a20.id, 'event_id' => e5.id})
participation26 = Participation.new({'athlete_id' => a21.id, 'event_id' => e2.id})
participation27 = Participation.new({'athlete_id' => a21.id, 'event_id' => e4.id})
participation28 = Participation.new({'athlete_id' => a22.id, 'event_id' => e6.id})
participation29 = Participation.new({'athlete_id' => a23.id, 'event_id' => e7.id})
participation30 = Participation.new({'athlete_id' => a24.id, 'event_id' => e8.id})
participation31 = Participation.new({'athlete_id' => a25.id, 'event_id' => e5.id})
participation32 = Participation.new({'athlete_id' => a25.id, 'event_id' => e2.id})
participation33 = Participation.new({'athlete_id' => a26.id, 'event_id' => e4.id})
participation34 = Participation.new({'athlete_id' => a26.id, 'event_id' => e2.id})
participation35 = Participation.new({'athlete_id' => a27.id, 'event_id' => e1.id})
participation36 = Participation.new({'athlete_id' => a28.id, 'event_id' => e6.id})
participation37 = Participation.new({'athlete_id' => a29.id, 'event_id' => e7.id})
participation38 = Participation.new({'athlete_id' => a30.id, 'event_id' => e8.id})

p1 = participation1.save
p2 = participation2.save
p3 = participation3.save
p4 = participation4.save
p5 = participation5.save
p6 = participation6.save
p7 = participation7.save
p8 = participation8.save
p9 = participation9.save
p10 = participation10.save
p11 = participation11.save
p12 = participation12.save
p13 = participation13.save
p14 = participation14.save
p15 = participation15.save
p16 = participation16.save
p17 = participation17.save
p18 = participation18.save
p19 = participation19.save
p20 = participation20.save
p21 = participation21.save
p22 = participation22.save
p23 = participation23.save
p24 = participation24.save
p25 = participation25.save
p26 = participation26.save
p27 = participation27.save
p28 = participation28.save
p29 = participation29.save
p30 = participation30.save
p31 = participation31.save
p32 = participation32.save
p33 = participation33.save
p34 = participation34.save
p35 = participation35.save
p36 = participation36.save
p37 = participation37.save
p38 = participation38.save

pp = Participation.all

# p1.update({'athlete_id' => a2.id, 'event_id' => e1.id})


# Event.update({ 'id' => e2.id, 'event_name' => e2.event_name, 'is_team' => false})

ind_result1 = IndividualEventResult.new({'event_id' => e4.id, 'gold_athlete' => a8.id, 'silver_athlete' => a3.id, 'bronze_athlete' =>a14.id})
ind_result2 = IndividualEventResult.new({'event_id' => e5.id, 'gold_athlete' => a13.id, 'silver_athlete' => a25.id, 'bronze_athlete' =>a7.id})

ir1 = ind_result1.save
ir2 = ind_result2.save

irir = IndividualEventResult.all

# team_result1 = TeamEventResult.new({'event_id' => e2.id, 'gold_nation' => n2.id, 'silver_nation' => n4.id, 'bronze_nation' => n5.id})

team_result1 = TeamEventResult.new({'event_id' => e2.id, 'gold_nation' => n2.id, 'silver_nation' => n4.id, 'bronze_nation' =>n5.id})

# binding.pry

tr1 = team_result1.save

trtr = TeamEventResult.all

pa = Participation.national_athletes(2,3)



# binding.pry
# nil
