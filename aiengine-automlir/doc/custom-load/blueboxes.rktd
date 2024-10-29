188
((3) 0 () 0 () () (h ! (equal) ((q def ((lib "custom-load/main.rkt") make-custom-load/use-compiled)) q (0 . 17)) ((q def ((lib "custom-load/top.rkt") current-zo-blacklist)) q (806 . 4))))
procedure
(make-custom-load/use-compiled [#:blacklist blacklist 
                                #:load-zo load-zo     
                                #:load-src load-src]) 
 -> (-> path?
        (or/c #f symbol? (cons/c (or/c #f symbol?) (listof symbol?)))
        any)
  blacklist : (treeof (or/c regexp? (-> path? any/c)))
            = (lambda (file) #f)
  load-zo : (-> path?
                (or/c #f symbol? (cons/c (or/c #f symbol?) (listof symbol?)))
                any)
          = (current-load/use-compiled)
  load-src : (-> path?
                 (or/c #f symbol? (cons/c (or/c #f symbol?) (listof symbol?)))
                 any)
           = (lambda (file want) ((current-load) file want))
parameter
(current-zo-blacklist) -> (-> path? any/c)
(current-zo-blacklist pred) -> void?
  pred : (treeof (or/c (-> path? any/c) regexp?))
