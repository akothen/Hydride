1211
((3) 0 () 1 ((q lib "net/rfc6455.rkt")) () (h ! (equal) ((c def c (c (? . 0) q ws-close!)) q (2735 . 7)) ((c def c (c (? . 0) q ws-recv)) q (2342 . 5)) ((c def c (c (? . 0) q hybi00-framing-mode)) q (3074 . 4)) ((c def c (c (? . 0) q ws-recv-stream)) q (2669 . 3)) ((c def c (c (? . 0) q ws-serve)) q (1010 . 8)) ((c def c (c (? . 0) q ws-url?)) q (0 . 3)) ((c def c (c (? . 0) q rfc6455-stream-buffer-size)) q (2953 . 4)) ((c def c (c (? . 0) q ws-conn-close-reason)) q (642 . 3)) ((c def c (c (? . 0) q ws-conn-supports-fragmentation?)) q (161 . 3)) ((c def c (c (? . 0) q ws-connect)) q (722 . 7)) ((c def c (c (? . 0) q ws-recv-evt)) q (2520 . 4)) ((c def c (c (? . 0) q ws-idle-timeout)) q (3201 . 4)) ((c def c (c (? . 0) q ws-conn-signals-status-on-close?)) q (417 . 3)) ((c def c (c (? . 0) q ws-send!)) q (1836 . 11)) ((c def c (c (? . 0) q wss-url?)) q (53 . 3)) ((c def c (c (? . 0) q ws-conn-supports-payload-type?)) q (241 . 5)) ((c def c (c (? . 0) q ws-serve*)) q (1465 . 4)) ((c def c (c (? . 0) q ws-conn-close-status)) q (562 . 3)) ((c def c (c (? . 0) q ws-conn?)) q (107 . 3)) ((c def c (c (? . 0) q ws-conn-closed?)) q (498 . 3)) ((c form c (c (? . 0) q ws-service-mapper)) q (1711 . 5))))
procedure
(ws-url? x) -> boolean?
  x : any/c
procedure
(wss-url? x) -> boolean?
  x : any/c
procedure
(ws-conn? x) -> boolean?
  x : any/c
procedure
(ws-conn-supports-fragmentation? c) -> boolean?
  c : ws-conn?
procedure
(ws-conn-supports-payload-type? c                 
                                payload-type) -> boolean?
  c : ws-conn?
  payload-type : symbol?
procedure
(ws-conn-signals-status-on-close? c) -> boolean?
  c : ws-conn?
procedure
(ws-conn-closed? c) -> boolean?
  c : ws-conn?
procedure
(ws-conn-close-status c) -> (or/c #f number?)
  c : ws-conn?
procedure
(ws-conn-close-reason c) -> (or/c #f string?)
  c : ws-conn?
procedure
(ws-connect  u                         
            [#:headers headers         
             #:protocol protocol]) -> ws-conn?
  u : (or/c ws-url? wss-url?)
  headers : (listof header?) = '()
  protocol : (or/c 'rfc6455 'hybi00) = 'rfc6455
procedure
(ws-serve conn-dispatch                        
          #:conn-headers conn-headers ...) -> (-> void)
  conn-dispatch : (-> ws-conn? request? void)
  conn-headers : (or/c (-> bytes? (listof header?) request?
                           (values (listof header?) any/c))
                       (-> bytes? (listof header?)
                           (values (listof header?) any/c)))
procedure
(ws-serve* service-mapper ...) -> (-> void)
  service-mapper : (-> url? (-> (or/c symbol? #f) (or/c #f
                                                        (-> ws-conn? void))))
syntax
(ws-service-mapper [uri-regexp [(protocol ...) function-expr] ...] ...)
 
protocol = symbol
         | #f
procedure
(ws-send!  c                                     
           payload                               
          [#:final-fragment? final-fragment?     
           #:payload-type payload-type           
           #:flush? flush?])                 -> void?
  c : ws-conn?
  payload : (or/c string? bytes? input-port?)
  final-fragment? : boolean? = #t
  payload-type : (or/c 'continuation 'text 'binary) = 'text
  flush? : boolean? = #t
procedure
(ws-recv c [#:payload-type payload-type])
 -> (or/c eof-object? string? bytes?)
  c : ws-conn?
  payload-type : (or/c 'auto 'text 'binary) = 'auto
procedure
(ws-recv-evt c [#:payload-type payload-type]) -> evt?
  c : ws-conn?
  payload-type : (or/c 'auto 'text 'binary) = 'auto
procedure
(ws-recv-stream c) -> input-port?
  c : ws-conn?
procedure
(ws-close!  c                     
           [#:status status       
            #:reason reason]) -> void?
  c : ws-conn?
  status : integer? = 1000
  reason : string? = ""
parameter
(rfc6455-stream-buffer-size) -> integer?
(rfc6455-stream-buffer-size size) -> void?
  size : integer?
parameter
(hybi00-framing-mode) -> (or/c 'new 'old)
(hybi00-framing-mode mode) -> void?
  mode : (or/c 'new 'old)
parameter
(ws-idle-timeout) -> number?
(ws-idle-timeout seconds) -> void?
  seconds : number?
