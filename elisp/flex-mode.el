; -*- Mode: Emacs-Lisp; -*- 

;  Eric Beuscher
;  Tulane University
;  Department of Computer Science
;  flex-mode.el
;
;  + modified Wed Sep 11 00:05:17 CEST 2002 by Bryan Jurish <moocow@ling.uni-potsdam.de>
;    - inherit gaudy font-lock keywords from c

(require 'derived)
(require 'cc-mode)
(require 'font-lock)

;;; font locking
(defvar flex--declarers '("%define")
  "Flex commands which can declare a token or state type")

(defvar flex-font-lock-keywords-1 c-font-lock-keywords
  "Basic highlighting for Flex mode.")

(defvar flex-font-lock-keywords-2
  (append
   (list
    (cons (concat "^\\(" (make-regexp flex--declarers) "\\)")
	  '(1 font-lock-keyword-face))
    )
   flex-font-lock-keywords-1
   c-font-lock-keywords-2)
  "Gaudy highlighting for Flex mode.")

(defvar flex-font-lock-keywords flex-font-lock-keywords-2
  "Default expressions to highlight in Flex mode")


(define-derived-mode flex-mode c-mode "Flex"
  "Major mode for editing flex files"
  
  ;; try to set the indentation correctly
  ;(setq-default c-basic-offset 4)
  (setq-default c-basic-offset 2)
  (make-variable-buffer-local 'c-basic-offset)

  (c-set-offset 'knr-argdecl-intro 0)
  (make-variable-buffer-local 'c-offsets-alist)
  
  ;; remove auto and hungry anything
  (c-toggle-auto-hungry-state -1)
  (c-toggle-auto-state -1)
  (c-toggle-hungry-state -1)

  ;; make a new keymap, and use it
  (setq flex-mode-map (make-keymap "flex-mode-map"))
  (use-local-map flex-mode-map)

  ;; get rid of that damn electric-brace which is not useful with flex
  (define-key flex-mode-map "{"	'self-insert-command)
  (define-key flex-mode-map "}"	'self-insert-command)

  (define-key flex-mode-map [tab] 'flex-indent-command)
  ;(define-key bison-mode-map [f10] 'c-indent-command)

  (setq comment-start "/*"
	comment-end "*/"
	)

  ;; set up font-lock keywords
  (make-local-variable 'font-lock-keywords)
  (setq font-lock-keywords nil)
  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults '((flex-font-lock-keywords
			      flex-font-lock-keywords-1
			      flex-font-lock-keywords-2)
			     nil nil nil))
  )

(defalias 'flex-indent-command 'c-indent-command)

(provide 'flex-mode)
