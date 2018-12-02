# Basic Ocaml HTTP server

### Make sure you have
```
opam install cohttp lwt js_of_ocaml
```
### For tls/ssl support
```
opam install tls ssl lwt_ssl 
```

### Compile and run server 
```
ocamlbuild -pkg cohttp-lwt-unix server_example.ml server_example.native
./server_example.native
```

### Compile and run client 
```
ocamlbuild -pkg cohttp-lwt-unix client_example.ml client_example.native
./client_example.native
```