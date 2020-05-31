(define (cubic x)
  (define (iter guess)
    (define (good-enough?)
      (let ((abs (lambda(x) (if (< x 0) (- x) x))) (cube (lambda(x) (* x x x))))
        (< (abs (- (cube guess) x)) (/ guess 1000))))
    (define (improve)
      (let ((square (lambda(x) (* x x))))
        (/ (+ (/ x (square guess)) (* 2 guess)) 3)))
    (if (good-enough?)
        guess
        (iter (improve))))
  (iter 1.0))

(cubic 64)

;; The body of a procedure can be a sequence of expressions
;; Scheme will return the value of the last one
(define (square x)
  (* x x)
  (+ x x))

(define (fact n)
  (if (= n 1)
      1
      (* n (fact (- n 1)))))

(fact 5)

(define (fact-iter product count max-count)
  (if (> count max-count)
      product
      (fact-iter (* product count) (+ count 1) max-count)))

(define (fact-tail n)
  (fact-iter 1 1 n))

(fact-tail 5)


;; Ackermann's function
;;
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fib n)
  (fib-iter 1 0 n))

(fib 6)



;; (f n) (A 0 n) is equal to 2n
;; (g n) (A 1 n) is equal to 2^n
;; (h n) (A 2 n) is equal to 2^(h(n-1))



#|
(A 2 4)

(A (- 2 1)
   (A 2 (- 4 1)))

(A (- 2 1)
   (A (- 2 1)
      (A 2 (- 3 1))))

(A (- 2 1)
   (A (- 2 1)
      (A (- 2 1)
         (A 2 (- 2 1)))))

(A (- 2 1)
   (A (- 2 1)
      (A (- 2 1) 2)))

(A (- 2 1)
   (A (- 2 1)
      (A (- 1 1)
         (A 1 (- 2 1)))))

(A (- 2 1)
   (A (- 2 1)
      (A (- 1 1) 2)))

(A (- 2 1)
   (A (- 2 1) 4))

(A (- 2 1)
   (A (- 1 1)
      (A 1 (- 4 1))))

(A (- 2 1)
   (A (- 1 1)
      (A (- 1 1)
         (A 1 (- 3 1)))))

(A (- 2 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A 1 (- 2 1))))))

(A (- 2 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1) 2))))

(A (- 2 1)
   (A (- 1 1)
      (A (- 1 1) 4)))

(A (- 2 1)
   (A (- 1 1) 8))

(A (- 2 1) 16)

(A (- 1 1)
   (A 1 (- 16 1)))

(A (- 1 1)
   (A (- 1 1)
      (A 1 (- 15 1))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A 1 (- 14 1)))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A 1 (- 13 1))))))

(A (- 1 1) 65536
   (A (- 1 1) 32768
      (A (- 1 1) 16384
         (A (- 1 1) 8192
            (A (- 1 1) 4096
               (A (- 1 1) 2048
                  (A (- 1 1) 1024
                     (A (- 1 1) 512
                        (A (- 1 1) 256
                           (A (- 1 1) 128
                              (A (- 1 1) 64
                                 (A (- 1 1) 32
                                    (A (- 1 1) 16
                                       (A (- 1 1) 8
                                          (A (- 1 1) 4
                                             (A (- 1 1) 2
                                                (A 1 (- 1 1))))))))))))))))))

|#



#|
(A 1 10)

(A (- 1 1)
   (A 1 (- 10 1)))

(A (- 1 1)
   (A (- 1 1)
      (A 1 (- 9 1))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A 1 (- 8 1)))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A 1 (- 7 1)))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A (- 1 1)
               (A 1 (- 6 1)))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A (- 1 1)
               (A (- 1 1)
                  (A 1 (- 5 1)))))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A (- 1 1)
               (A (- 1 1)
                  (A (- 1 1)
                     (A 1 (- 4 1))))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A (- 1 1)
               (A (- 1 1)
                  (A (- 1 1)
                     (A (- 1 1)
                        (A 1 (- 3 1))))))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A (- 1 1)
               (A (- 1 1)
                  (A (- 1 1)
                     (A (- 1 1)
                        (A (- 1 1)
                           (A 1 (- 2 1)))))))))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A (- 1 1)
               (A (- 1 1)
                  (A (- 1 1)
                     (A (- 1 1)
                        (A (- 1 1) 2)))))))))

(A (- 1 1)
   (A (- 1 1)
      (A (- 1 1)
         (A (- 1 1)
            (A (- 1 1)
               (A (- 1 1)
                  (A (- 1 1)
                     (A (- 1 1) 4))))))))

(a (- 1 1)
   (a (- 1 1)
      (a (- 1 1)
         (a (- 1 1)
            (a (- 1 1)
               (a (- 1 1)
                  (a (- 1 1) 8)))))))

(a (- 1 1)
   (a (- 1 1)
      (a (- 1 1)
         (a (- 1 1)
            (a (- 1 1)
               (a (- 1 1) 16))))))

(a (- 1 1)
   (a (- 1 1)
      (a (- 1 1)
         (a (- 1 1)
            (a (- 1 1) 32)))))

(a (- 1 1)
   (a (- 1 1)
      (a (- 1 1)
         (a (- 1 1) 64))))

(a (- 1 1)
   (a (- 1 1)
      (a (- 1 1) 128)))

(a (- 1 1)
   (a (- 1 1) 256))

(a (- 1 1) 512)
1024
|#


;;LOG:
;;50 min
;;+ 75 min
;;+ 75 min 
;;TOTAL: 200 min
