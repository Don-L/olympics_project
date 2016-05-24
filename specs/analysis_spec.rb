require_relative('minitest/autorun')
require_relative('minitest/rg')
require_relative('../models/analysis')
require_relative('../models/nation')


class TestAnalysis < Minitest::Test


  def setup

    @nation1 = Nation.new({'nation_name' => 'France'})
    @nation2 = Nation.new({'nation_name' => 'Great Britain and Northern Ireland'})
    @nation3 = Nation.new({'nation_name' => 'Russia'})
    @nation4 = Nation.new({'nation_name' => 'Germany'})
    @nation5 = Nation.new({'nation_name' => 'United States of America'})

    @nations = [@nation1, @nation2, @nation3, @nation4, nation5]

    @event1 = Event.new({'event_name' => "Men - Individual Road Race", 'is_team' => false})
    @event2 = Event.new({'event_name' => "Mixed Doubles", 'is_team' => true})
    @event3 = Event.new({'event_name' => "Men - 200 Metres", 'is_team' => false})
    @event4 = Event.new({'event_name' => "Men - Singles", 'is_team' => false})
    @event5 = Event.new({'event_name' => "Women - Singles", 'is_team' => false})
    @event6 = Event.new({'event_name' => "Women - 100 Metres", 'is_team' => false})
    @event7 = Event.new({'event_name' => "Dressage", 'is_team' => false})
    @event8 = Event.new({'event_name' => "Women - 100 Metres Freestyle", 'is_team' => false})

    @events = [@event1, @event2, @event3, @event4, @event5, @event6, @event7, @event8]

    @athlete1 = Athlete.new({'last_name' => 'Lemaitre', 'first_name' => 'Christophe', 'nation_id' => @nation1.id})
    @athlete2 = Athlete.new({'last_name' => 'Chavanel', 'first_name' => 'Sylvain', 'nation_id' => @nation1.id})
    @athlete3 = Athlete.new({'last_name' => 'Tsonga', 'first_name' => 'Jo-Wilfried', 'nation_id' => @nation1.id})
    @athlete4 = Athlete.new({'last_name' => 'Mang', 'first_name' => 'Veronique', 'nation_id' => @nation1.id})
    @athlete5 = Athlete.new({'last_name' => 'Michel', 'first_name' => 'Jessica', 'nation_id' => @nation1.id})
    @athlete6 = Athlete.new({'last_name' => 'Bonnet', 'first_name' => 'Charlotte', 'nation_id' => @nation1.id})



    @athlete7 = Athlete.new({'last_name' => 'Robson', 'first_name' => 'Laura', 'nation_id' => @nation2.id})
    @athlete8 = Athlete.new({'last_name' => 'Murray', 'first_name' => 'Andy', 'nation_id' => @nation2.id})
    @athlete9 = Athlete.new({'last_name' => 'Wiggins', 'first_name' => 'Bradley', 'nation_id' => @nation2.id})
    @athlete10 = Athlete.new({'last_name' => 'Oyepitan', 'first_name' => 'Abi', 'nation_id' => @nation2.id})
    @athlete11 = Athlete.new({'last_name' => 'Dujardin', 'first_name' => 'Charlotte', 'nation_id' => @nation2.id})
    @athlete12 = Athlete.new({'last_name' => 'Smith', 'first_name' => 'Amy', 'nation_id' => @nation2.id})



    @athlete13 = Athlete.new({'last_name' => 'Vesning', 'first_name' => 'Elena', 'nation_id' => @nation3.id})
    @athlete14 = Athlete.new({'last_name' => 'Youzhny', 'first_name' => 'Mikhail', 'nation_id' => @nation3.id})
    @athlete15 = Athlete.new({'last_name' => 'Kolobnev', 'first_name' => 'Alexandr', 'nation_id' => @nation3.id})
    @athlete16 = Athlete.new({'last_name' => 'Belkina', 'first_name' => 'Olga', 'nation_id' => @nation3.id})
    @athlete17 = Athlete.new({'last_name' => 'Nastenko', 'first_name' => 'Mikhail', 'nation_id' => @nation3.id})
    @athlete18 = Athlete.new({'last_name' => 'Popova', 'first_name' => 'Veronika', 'nation_id' => @nation3.id})



    @athlete19 = Athlete.new({'last_name' => 'Greipel', 'first_name' => 'Andre', 'nation_id' => @nation4.id})
    @athlete20 = Athlete.new({'last_name' => 'Kerber', 'first_name' => 'Angelique', 'nation_id' => @nation4.id})
    @athlete21 = Athlete.new({'last_name' => 'Petzchner', 'first_name' => 'Philipp', 'nation_id' => @nation4.id})
    @athlete22 = Athlete.new({'last_name' => 'Pinta', 'first_name' => 'Tatjana', 'nation_id' => @nation4.id})
    @athlete23 = Athlete.new({'last_name' => 'Langehanenberg', 'first_name' => 'Helen', 'nation_id' => @nation4.id})
    @athlete24 = Athlete.new({'last_name' => 'Schreiber', 'first_name' => 'Daniela', 'nation_id' => @nation4.id})



    @athlete25 = Athlete.new({'last_name' => 'Raymond', 'first_name' => 'Lisa', 'nation_id' => @nation5.id})
    @athlete26 = Athlete.new({'last_name' => 'Bryan', 'first_name' => 'Mike', 'nation_id' => @nation5.id})
    @athlete27 = Athlete.new({'last_name' => 'Farrar', 'first_name' => 'Tyler', 'nation_id' => @nation5.id})
    @athlete28 = Athlete.new({'last_name' => 'Jeter', 'first_name' => 'Carmelita', 'nation_id' => @nation5.id})
    @athlete29 = Athlete.new({'last_name' => 'Peters', 'first_name' => 'Steffen', 'nation_id' => @nation5.id})
    @athlete30 = Athlete.new({'last_name' => 'Franklin', 'first_name' => 'Missy', 'nation_id' => @nation5.id})

    @participation1 = Participation.new({'athlete_id' => @athlete1.id, 'event_id' => @event3.id})
    @participation2 = Participation.new({'athlete_id' => @athlete2.id, 'event_id' => @event1.id})
    @participation3 = Participation.new({'athlete_id' => @athlete3.id, 'event_id' => @event4.id})
    @participation4 = Participation.new({'athlete_id' => @athlete4.id, 'event_id' => @event6.id})
    @participation5 = Participation.new({'athlete_id' => @athlete5.id, 'event_id' => @event7.id})
    @participation6 = Participation.new({'athlete_id' => @athlete6.id, 'event_id' => @event8.id})
    @participation7 = Participation.new({'athlete_id' => @athlete7.id, 'event_id' => @event2.id})
    @participation8 = Participation.new({'athlete_id' => @athlete7.id, 'event_id' => @event5.id})
    @participation9 = Participation.new({'athlete_id' => @athlete8.id, 'event_id' => @event4.id})
    @participation10 = Participation.new({'athlete_id' => @athlete8.id, 'event_id' => @event2.id})
    @participation11 = Participation.new({'athlete_id' => @athlete9.id, 'event_id' => @event1.id})
    @participation12 = Participation.new({'athlete_id' => @athlete10.id, 'event_id' => @event6.id})
    @participation13 = Participation.new({'athlete_id' => @athlete11.id, 'event_id' => @event7.id})
    @participation14 = Participation.new({'athlete_id' => @athlete12.id, 'event_id' => @event8.id})
    @participation15 = Participation.new({'athlete_id' => @athlete13.id, 'event_id' => @event2.id})
    @participation16 = Participation.new({'athlete_id' => @athlete13.id, 'event_id' => @event5.id})
    @participation17 = Participation.new({'athlete_id' => @athlete14.id, 'event_id' => @event4.id})
    @participation18 = Participation.new({'athlete_id' => @athlete14.id, 'event_id' => @event2.id})
    @participation19 = Participation.new({'athlete_id' => @athlete15.id, 'event_id' => @event1.id})
    @participation20 = Participation.new({'athlete_id' => @athlete16.id, 'event_id' => @event6.id})
    @participation21 = Participation.new({'athlete_id' => @athlete17.id, 'event_id' => @event7.id})
    @participation22 = Participation.new({'athlete_id' => @athlete18.id, 'event_id' => e8.id})
    @participation23 = Participation.new({'athlete_id' => @athlete19.id, 'event_id' => e1.id})
    @participation24 = Participation.new({'athlete_id' => a20.id, 'event_id' => e2.id})
    @participation25 = Participation.new({'athlete_id' => a20.id, 'event_id' => e5.id})
    @participation26 = Participation.new({'athlete_id' => a21.id, 'event_id' => e2.id})
    @participation27 = Participation.new({'athlete_id' => a21.id, 'event_id' => e4.id})
    @participation28 = Participation.new({'athlete_id' => a22.id, 'event_id' => e6.id})
    @participation29 = Participation.new({'athlete_id' => a23.id, 'event_id' => e7.id})
    @participation30 = Participation.new({'athlete_id' => a24.id, 'event_id' => e8.id})
    @participation31 = Participation.new({'athlete_id' => a25.id, 'event_id' => e5.id})
    @participation32 = Participation.new({'athlete_id' => a25.id, 'event_id' => e2.id})
    @participation33 = Participation.new({'athlete_id' => a26.id, 'event_id' => e4.id})
    @participation34 = Participation.new({'athlete_id' => a26.id, 'event_id' => e2.id})
    @participation35 = Participation.new({'athlete_id' => a27.id, 'event_id' => e1.id})
    @participation36 = Participation.new({'athlete_id' => a28.id, 'event_id' => e6.id})
    @participation37 = Participation.new({'athlete_id' => a29.id, 'event_id' => e7.id})
    @participation38 = Participation.new({'athlete_id' => a30.id, 'event_id' => e8.id})


  end


























  end