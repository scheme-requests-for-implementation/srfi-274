;;;; SPDX-FileCopyrightText: 2026 Peter McGoron
;;;; SPDX-License-Identifier: MIT
(define-library (srfi NNN internal)
  (import (scheme base))
  (export argcheck!)
  (begin
    (define (argcheck! who start end)
      (cond
        ((not (exact-integer? start))
         (error who "start must be an exact integer"))
        ((not (exact-integer? end))
         (error who "end must be an exact integer"))
        ((not (<= 0 start end))
         (error who
                "invariant: (<= 0 start end)"
                start end))))))