#lang racket/gui

(define main-frame
  (new frame%
       [label "I'm a GUI Tool!"]
       [width 300]
       [height 100]))

(define msg
  (new message%
       [parent main-frame]
       [auto-resize #t]
       [label "Hi, there!"]))

(new button%
     [parent main-frame]
     [label "Click Me"]
     [callback (λ (button event)
                 (send msg set-label "You didn't say may I!"))])

(send main-frame show #t)
