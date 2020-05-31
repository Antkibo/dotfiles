#!/home/sigil/.nix-profile/bin/guile \
-e main -s
!#
(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))
(define (main args)
  (for-each (lambda (arg) (display (fact (string->number arg))) (newline))
       (cdr args)))
