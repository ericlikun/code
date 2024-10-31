#lang racket/gui
(require racket/draw)

(define WIDTH 600)
(define HEIGHT 400)
(define UNIT 6)
(define OFFSET-X 140)
(define OFFSET-Y 75)

(define START-X (- (/ WIDTH 2) UNIT OFFSET-X))
(define START-Y (- (/ HEIGHT 2) UNIT OFFSET-Y))

(define tiling (make-bitmap WIDTH HEIGHT))
(define dc (new bitmap-dc% [bitmap tiling]))

(define TILE-PEN (new pen% [color "black"] [width 1] [style 'solid]))
(send dc set-pen TILE-PEN)

(define TILE-BRUSH (new brush% [color "yellow"] [style 'solid]))
(send dc set-brush TILE-BRUSH)

(define (draw-tile x y s)
  (send dc draw-rectangle x y s s))

(define (F n)
  (define (f a b cnt)
    (if (= cnt 0) b
        (f (+ a b) a (- cnt 1))))
  (f 1 0 n))


(define SPIRAL-PEN (new pen% [color "red"] [width 2] [style 'solid]))
(define TRANS-BRUSH (new brush% [style 'transparent]))

(define 0d 0)
(define 90d (/ pi 2))
(define 180d pi)
(define 270d (* 3 (/ pi 2)))
(define 360d (* 2 pi))

(define (arc x y r a)
  (let-values ([(d) (values (* 2 r))]
               [(start stop x y)
                (case a
                  [(0) (values  90d 180d x       y      )]
                  [(1) (values 180d 270d x       (- y r))]
                  [(2) (values 270d 360d (- x r) (- y r))]
                  [(3) (values   0d  90d (- x r) y      )])])
    (send dc set-pen SPIRAL-PEN)
    (send dc set-brush TRANS-BRUSH)
    (send dc draw-arc x y d d start stop)
    (send dc set-pen TILE-PEN)
    (send dc set-brush TILE-BRUSH)))


(define (draw-n n)
  (let* ([fn (F n)]
         [sn (* UNIT fn)]
         [fn1 (F (sub1 n))]
         [sn1 (* UNIT fn1)]
         [n-mod-4 (remainder n 4)])
    (cond [(< n 2) #f]
          [(= n 2) (values (+ UNIT START-X) START-Y START-X START-Y)]
          [else
           (let-values ([(x1 y1 x2 y2) (draw-n (sub1 n))])
             (let-values ([(x y)
                           (case n-mod-4
                             [(0) (values (- x1 sn) y1)]
                             [(1) (values x1 (+ y1 sn1))]
                             [(2) (values (+ x1 sn1) y2)]
                             [(3) (values x2 (- y1 sn))])])
               (draw-tile x y sn)
               (arc x y sn n-mod-4)
               (values x y x1 y1)))])))
                          
(define (draw-tiles n)
  (draw-tile START-X START-Y UNIT)
  (draw-tile (+ UNIT START-X) START-Y UNIT)
  (draw-n n)
  (print tiling))

(draw-tiles 10)

                  