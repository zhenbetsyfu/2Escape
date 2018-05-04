open Unix
open Lwt

let () = Lwt_log.add_rule "*" Lwt_log.Info

(* type of server. input channels and outputchannel *)
type t = in_channel list * out_channel

let create_server (port : int) : unit = 
  failwith "TODO"

(** 
 * Temporary Helper method to get the ip address of the local computer
 * Used for testing client-server interaction
 *)
let get_my_addr () =
  (Unix.gethostbyname(Unix.gethostname())).Unix.h_addr_list.(0) ;;

(**
 * Temporary method to test trivial interactions with server
 * send back the same command received from the client
 *)
let print_out ic oc =
   try while true do
         let s = input_line ic in
          output_string oc (s^"\n") ; flush oc
       done
   with _ -> Printf.printf "End of text\n" ;
              flush Pervasives.stdout;
               exit 0 ;;

(**
 * Temporary method to test server instantiation
 *)			   
let main_server serv_fun =
   try
   let port = 40005 in
   let addr = ADDR_INET (get_my_addr (), port)
   in establish_server print_out addr
       with
         Failure _ ->
         Printf.eprintf "serv_up : bad port number\n" ;;

(**
 * Temporary method to start server
 *)
let start_server () =
   Unix.handle_unix_error main_server print_out;;
