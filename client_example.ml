open Lwt
open Cohttp
open Cohttp_lwt_unix

let url = (Uri.of_string "https://api.github.com/users/konforti/repos")

let body =
  Client.get url 
    >>= fun (resp, body) ->
      let code = resp 
        |> Response.status 
        |> Code.code_of_status
        in

      Printf.printf "Response code: %d\n" code;
    
      let headers = resp 
        |> Response.headers 
        |> Header.to_string 
        in
      Printf.printf "Headers: %s\n" headers;
    
      body 
        |> Cohttp_lwt.Body.to_string 
        >|= fun body ->
          let length = String.length body in
          Printf.printf "Body of length: %d\n" length;
    
      body

let () =
  let body = Lwt_main.run body in
  print_endline ("Received body\n" ^ body)
