open State
open Json_parser

let start_script_player1 : Cutscene.t =
	[("start_1","Your uncle Tom died a few days ago.
	 From his left letters, you know that he has built a secret house at the far away countryside to memorize his dead wife.
	 He asked you to help him taking care of the house and if possible fixing some broken parts of the house.");
	 ("start_1","You invited your friends Dave to go with you together.");
	 ("start_2","You and Dave arrive at the house");
	 ("start_2","From outside, the color of the house is a combination of black and white");
	 ("start_2","\"It’s the most classical house I’ve ever seen,\" said Dave.");
	 ("start_2","You and Dave step into the house");
     ("start_3","In a sudden, the door closed.");
	 ("start_4","A huge metal bar fell down,
	 together brought down a few pieces of furniture from the upper floors and divided the hall into two parts.");
	 ("start_4","\"Where are you,\" you yelled");
	 ("start_4","Dave’s voice came from another room,\"I am blocked in a different area. Guess we have to find the way out separately.\"");
	 ("start_4","Please find the way to get out of the room and fix the broken part of the house")
	]

let start_script_player2 : Cutscene.t =
	[("start_1","Anne’s uncle Tom died a few days ago.
	 Anne knew her uncle has built a secret house at the far away countryside to memorize his dead wife.
	 Tom asked Anne to take care of the house and fix some broken parts of the house. Anne invited you to go with her together.");
	 ("start_2","You and Anne arrive at the house.");
	 ("start_2","From outside, the color of the house is a combination of black and white");
	 ("start_2","\"It’s the most classical house I’ve ever seen,\" You commented");
	 ("start_2","You and Anne step into the house");
     ("start_3","In a sudden, the door closed.");
	 ("start_4","A huge metal bar fell down,
	 together brought down a few pieces of furniture from the upper floors and divided the hall into two parts.");
	 ("start_4", "\"Where are you\" You heard the voice from Anne");
	 ("start_4", "\"I am blocked in a different area. Guess we have to find the way out separately,\" you responded.");
	 ("start_4", "Please find the way to get out of the room and fix the broken part of the house")
	]

let end_script : Cutscene.t =
	[("end","You and your friend successfully got out of the house and fixed the broken part of the house.");
	 ("end","Anne’s aunt is a pianist and died from an accident.");
	 ("end","To remember the beautiful melody aunt played, her uncle build the “music box” house.");
	 ("end","Even if you go out of the house, you still can hear the melodious music");
	 ("end","It’s the music of love.")
	]

let air_to_gears : exit = { id = "exit"; is_open = false; to_room = ("gears",4,2); cscene = None }

let air_to_study : exit = { id = "exit"; is_open = true; to_room = ("study",0,2); cscene = None}

let turbine_loc = {id = "cross"; key = "turbine"; is_solved = false; exit_effect = [("air",5,3)]; immovable_effect = []}

let air =
  {id = "air";
   tiles =
     [|
       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = Some {id = "turbine"}; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "turbine_topleft"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "turbine_topright"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "turbine_bottomleft"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = Some turbine_loc; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some air_to_gears; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some air_to_study; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];
     |];
   rows = 5; cols = 6}

let study_to_air = { id = "exit"; is_open = true; to_room = ("air",2,4); cscene = None }

let study_to_basement = { id = "exit"; is_open = true; to_room = ("basement",2,2); cscene = None }

let study_to_hall = { id = "exit"; is_open = true; to_room = ("hall",0,8); cscene = None }

let study =
  {id = "study";
   tiles =
     [|
       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "red_bookshelf"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some study_to_air; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "red_bookshelf"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "red_bookshelf"}; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "red_bookshelf"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = Some {id = "blue_bookshelf"}; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = Some {id = "blue_bookshelf"}; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = Some {id = "blue_bookshelf"}; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = Some {id = "desk_top"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some study_to_basement; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = Some {id = "blue_bookshelf"}; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some study_to_hall; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov =  Some {id = "desk_bottom"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];
     |];
   rows = 5; cols = 6}

let basement_to_study = {id = "exit"; is_open = false; to_room = ("study",5,3); cscene = None}

let ladder_loc = {id = "cross"; key = "ladder"; is_solved = false; exit_effect = [("basement",3,3)]; immovable_effect = []}

let basement =
  {id = "basement";
   tiles =
     [|
       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = Some {id = "ladder"}; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some basement_to_study; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = Some ladder_loc; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];
     |];
   rows = 5; cols = 6}

let workshop_to_handler = {id = "exit"; is_open = false; to_room = ("handler",3,4); cscene = None}

let workshop_to_hall = {id = "exit"; is_open = true; to_room = ("hall",5,8); cscene = None}

let workshop_key_loc = {
  id = "cross";
  key = "workshop_key";
  is_solved = false;
  exit_effect = [("workshop",3,0)];
  immovable_effect = []
}

let rope_loc = {
  id = "cross";
  key = "rope";
  is_solved = false;
  exit_effect = [];
  immovable_effect = [("air",5,3)]
}

let workshop =
  {id = "workshop";
   tiles =
     [|
       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = Some {id = "steel"}; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some workshop_to_handler; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = Some workshop_key_loc; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = Some {id = "workshop_key"}; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = Some {id = "rope"}; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = Some {id = "steel"}; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = Some rope_loc; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "workshop_desk_top"}; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = Some workshop_to_hall; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = Some {id = "steel"}; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "workshop_desk_bottom"}; ex = None; kl = None; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = Some {id = "steel"}; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];
     |];
   rows = 5; cols = 6}

let handler_to_gears = {id = "exit"; is_open = true; to_room = ("gears",15,0); cscene = None}

let handler_to_workshop = {id = "exit"; is_open = true; to_room = ("workshop",0,3); cscene = None}

let hall_handler_loc = {
  id = "cross";
  key = "hall_handler_key";
  is_solved = false;
  exit_effect = [];
  immovable_effect = [("air",2,3)]
}

let handler =
  {id = "handler";
   tiles =
     [|
       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some handler_to_gears; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = Some hall_handler_loc; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some handler_to_workshop; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];
     |];
   rows = 5; cols = 6}

let hall_to_study = {id = "exit"; is_open = false; to_room = ("study",5,3); cscene = Some start_script_player1}

let hall_to_workshop = {id = "exit"; is_open = true; to_room = ("workshop",0,3); cscene = Some start_script_player2}

let book_loc = {
  id = "cross";
  key = "book";
  is_solved = false;
  exit_effect = [("hall",0,8)];
  immovable_effect = []
}

let hall =
  {id = "hall";
   tiles =
     [|
       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = Some {id = "hall_handler_key"}; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "red_bookshelf"}; ex = None; kl = None; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = Some {id = "book"}; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = Some book_loc; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = Some {id = 2; direction = Left}; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = None; ex = Some hall_to_study; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = Some {id = 1; direction = Right}; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some hall_to_workshop; kl = None; rt = None};|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "debris"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];
     |];
   rows = 10; cols = 6}

let gears_to_clock = {id = "exit"; is_open = false; to_room = ("hall",0,0); cscene = Some end_script}

let stick_loc = {
  id = "cross";
  key = "stick";
  is_solved = false;
  exit_effect = [];
  immovable_effect = [("gears",11,2)]
}

let clocktower_loc = {
  id = "cross";
  key = "clocktower_key";
  is_solved = false;
  exit_effect = [("gears",5,7)];
  immovable_effect = []
}


let gear_a_1 = {id = "gear_a"; rotate = Left; correct = Up;
                exit_effect = []; immovable_effect = [("gears",14,4)]}
let gear_a_2 = {id = "gear_a"; rotate = Up; correct = Right;
                exit_effect = []; immovable_effect = [("gears",14,5)]}
let gear_a_3 = {id = "gear_a"; rotate = Right; correct = Down;
                exit_effect = []; immovable_effect = [("gears",13,5)]}
let gear_a_4 = {id = "gear_a"; rotate = Down; correct = Left;
                exit_effect = []; immovable_effect = [("gears",8,2)]}

let gear_b_1 = {id = "gear_1"; rotate = Left; correct = Up;
                exit_effect = []; immovable_effect = [("gears",15,1)]}
let gear_b_2 = {id = "gear_2"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",16,1)]}
let gear_b_3 = {id = "gear_3"; rotate = Down; correct = Up;
                exit_effect = []; immovable_effect = [("gears",16,2)]}
let gear_b_4 = {id = "gear_4"; rotate = Down; correct = Up;
                exit_effect = []; immovable_effect = [("gears",16,3)]}
let gear_b_5 = {id = "gear_5"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",15,3)]}
let gear_b_6 = {id = "gear_6"; rotate = Left; correct = Up;
                exit_effect = []; immovable_effect = [("gears",14,3)]}
let gear_b_7 = {id = "gear_7"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",14,2)]}
let gear_b_8 = {id = "gear_8"; rotate = Down; correct = Up;
                exit_effect = []; immovable_effect = [("gears",6,2)]}

let gear_c_1 = {id = "gear_1"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",3,3)]}
let gear_c_2 = {id = "gear_2"; rotate = Left; correct = Up;
                exit_effect = []; immovable_effect = [("gears",4,3)]}
let gear_c_3 = {id = "gear_3"; rotate = Down; correct = Up;
                exit_effect = []; immovable_effect = [("gears",4,4)]}
let gear_c_4 = {id = "gear_4"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",4,5)]}
let gear_c_5 = {id = "gear_5"; rotate = Down; correct = Up;
                exit_effect = []; immovable_effect = [("gears",3,5)]}
let gear_c_6 = {id = "gear_6"; rotate = Down; correct = Up;
                exit_effect = []; immovable_effect = [("gears",2,5)]}
let gear_c_7 = {id = "gear_7"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",2,4)]}
let gear_c_8 = {id = "gear_8"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",10,2)]}

let gear_d_1 = {id = "gear_d"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",2,1)]}
let gear_d_2 = {id = "gear_d"; rotate = Down; correct = Right;
                exit_effect = []; immovable_effect = [("gears",2,2)]}
let gear_d_3 = {id = "gear_d"; rotate = Left; correct = Down;
                exit_effect = []; immovable_effect = [("gears",1,2)]}
let gear_d_4 = {id = "gear_d"; rotate = Up; correct = Left;
                exit_effect = []; immovable_effect = [("gears",7,2)]}

let gear_e_1 = {id = "gear_1"; rotate = Left; correct = Up;
                exit_effect = []; immovable_effect = [("gears",14,7)]}
let gear_e_2 = {id = "gear_2"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",9,2)]}
let gear_e_3 = {id = "gear_3"; rotate = Right; correct = Up;
                exit_effect = []; immovable_effect = [("gears",15,8)]}
let gear_e_4 = {id = "gear_4"; rotate = Left; correct = Up;
                exit_effect = []; immovable_effect = [("gears",15,9)]}
let gear_e_5 = {id = "gear_5"; rotate = Down; correct = Up;
                exit_effect = []; immovable_effect = [("gears",13,7)]}

let gear_e_6 = {id = "gear_6"; rotate = Up; correct = Up;
                exit_effect = []; immovable_effect = [("gears",13,9)]}
let gear_e_7 = {id = "gear_7"; rotate = Up; correct = Up;
                exit_effect = []; immovable_effect = [("gears",13,8)]}
let gear_e_8 = {id = "gear_8"; rotate = Up; correct = Up;
                exit_effect = []; immovable_effect = [("gears",9,2)]}

let gears =
  {id = "gears";
   tiles =
     [|
       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "wood"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "wood"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "wood"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "wood"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "wood"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "wood"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "wood"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = Some gear_a_1};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_a_2};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "teeth"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "teeth"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "teeth"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "teeth"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "teeth"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "teeth"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = Some gear_c_1};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_c_2};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_c_3};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_a_4};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_a_3};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "b"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "d"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "a"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "e"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "c"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_c_8};
         {ch = None; mov = None; store = Some {id = "c_key"}; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_c_4};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = Some gear_b_1};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_b_2};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_b_3};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_1"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_2"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_3"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_4"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_5"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_6"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_7"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_c_7};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_c_6};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_c_5};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = Some {id = "stick"}; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_b_8};
         {ch = None; mov = None; store = Some {id = "b_key"}; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_b_4};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_8"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_9"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_10"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_11"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_12"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_13"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_14"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = Some gear_d_1};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_d_2};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = Some stick_loc; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_b_7};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_b_6};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_b_5};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_15"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_16"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_17"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_18"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_19"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_20"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "cylinder_21"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_d_4};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_d_3};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = Some gears_to_clock; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_e_1};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_e_2};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = Some gear_e_3};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = Some clocktower_loc; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_e_8};
         {ch = None; mov = None; store = Some {id = "e_key"}; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_e_4};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = Some {id = "clocktower_key"}; immov = None; ex = None; kl = None; rt = None}|];

       [|{ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "black"}; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_e_7};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_e_6};
         {ch = None; mov = None; store = None; immov = Some {id = "transparent"}; ex = None; kl = None; rt = Some gear_e_5};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None};
         {ch = None; mov = None; store = None; immov = None; ex = None; kl = None; rt = None}|];
     |];
   rows = 10; cols = 19}

let roommap =
  let table = Hashtbl.create 10 in
  Hashtbl.add table "air" air;
  Hashtbl.add table "study" study;
  Hashtbl.add table "basement" basement;
  Hashtbl.add table "workshop" workshop;
  Hashtbl.add table "handler" handler;
  Hashtbl.add table "hall" hall;
  Hashtbl.add table "gears" gears;
  table

let gamestate =
  {roommap = roommap;
   pl1_loc = ("hall", 2, 8); pl2_loc = ("hall", 4, 7);
   pl1_inv = ["book"]; pl2_inv = [];
   chat = []}
