#lang racket/gui

(define my-language 'English)

(define translations
  #hash([Chinese . "你好世界"]
        [English . "Hello world"]))

(define my-hello-world
  (hash-ref translations my-language
            "hello world"))

(message-box "" my-hello-world)