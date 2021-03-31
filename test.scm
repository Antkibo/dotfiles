(define (slice lst start end)
  (if (= start end)
      '()
      (cons (nth lst start) (slice lst (+ start 1) end))))

;; Get a list and a number
;; Check if sentinel is equal to given index
;; If true, return first element of list
;; If false, add 1 to sentinel and remove first element from list
(define (nth lst num)
  (letrec ((iter (lambda (lst num sentinel)
                   (if (= sentinel num)
                       (car lst)
                       (iter (cdr lst) num (+ sentinel 1))))))
    (iter lst num 0)))

;; Get a list and a number
;; Check if list is of given length
;; If true, return list
;; If false, add a 0 to the left and go to step 2
(define (pad lst num)
  (if (= (len lst) num)
      lst
      (pad (cons 0 lst) num)))

;; Get a list
;; If list is null, return accumulator
;; If list is not null, add 1 to accumulator
;; Remove first element from list and go to step 2
(define (len lst)
  (letrec ((iter (lambda (lst acc)
                   (if (null? lst)
                       acc
                       (iter (cdr lst) (+ acc 1))))))
    (iter lst 0)))
