open Core

(* The name of this package. Ideally, should not be hard-coded. *)
let pkg_name = "ocaml-python"

(* The name of the python script to invoke. *)
let script_name = "my-script.pyc"

(* At runtime, we look for the python script in the opam library folder of our
   package. *)
let pyscript = match Findlib.package_directory pkg_name with
  | dir ->
    dir ^ "/" ^ script_name
  | exception Findlib.No_such_package _ ->
    failwith ("missing ocamlfind dependency: " ^ pkg_name)


let () = begin
  (* start Python 3 process *)
  let cmd = "python3 " ^ pyscript in
  let (from_py, to_py) = Unix.open_process cmd in

  (* send some stuff to python *)
  printf "[ocaml] sending message to python...\n%!";
  (* force out_channel to flush immediately with `%!` *)
  Out_channel.fprintf to_py
    "Hi there, Python! This is 🐪. My favorite number is %d.\n%!" 42;

  (* receive stuff from python *)
  begin try while true do
    (* receive one line at a time *)
    printf "[ocaml] waiting for python response...\n%!";
    let line = In_channel.input_line_exn from_py in

    (* Do something with line! *)
    (* As an example, we will just print the line to stdout and then close the
       pipe to Python. *)
     printf "[ocaml] received from Python: \"%s\"\n%!" line;

     (* closing the pipe to Python will cause the script to terminate *)
     Out_channel.close to_py;
  done with
    | End_of_file -> ()
  end;

  printf "[ocaml] All done. Bye bye!\n%!";
end
