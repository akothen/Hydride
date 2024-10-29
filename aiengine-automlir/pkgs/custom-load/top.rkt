#lang racket/base
(require "private/loader.rkt")
(provide current-zo-blacklist)

;; ============================================================
;; Top-level convenience layer

(define current-zo-blacklist
  (make-parameter
   (lambda (mod) #f)
   (lambda (spec) (blacklist->pred 'current-zo-blacklist spec))))

(current-load/use-compiled
 (make-custom-load/use-compiled
  #:blacklist (lambda (mod) ((current-zo-blacklist) mod))))
