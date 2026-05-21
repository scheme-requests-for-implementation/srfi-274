;;;; SPDX-FileCopyrightText: 2026 Peter McGoron
;;;; SPDX-License-Identifier: MIT
(define-library (srfi NNN 41)
  (import (scheme base) (scheme case-lambda)
          (srfi NNN internal)
          (except (srfi 41) list->stream)
          (prefix (only (srfi 41) list->stream) srfi-41:))
  (export list->stream)
  (begin
    (define list->stream
      (case-lambda
        ((lst) (srfi-41:list->stream lst))
        ((lst start) (srfi-41:list->stream (list-tail lst start)))
        ((lst start end)
         (argcheck! lst start end)
         (letrec ((loop (stream-lambda (lst start)
                        (if (= start end)
                            stream-null
                            (stream-cons (car lst)
                                         (loop (cdr lst)
                                               (+ start 1)))))))
           (loop (list-tail lst start) start)))))))