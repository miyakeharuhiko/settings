;;(package-initialize)
;;(setq package-archives
;;      '(("gnu" . "http://elpa.gnu.org/packages/")
;;	("melpa" . "http://melpa.org/packages/")
;;	("org" . "http://orgmode.org/elpa/")))


(add-to-list 'load-path "~/.emacs.d/indent-guide-master/")
(add-to-list 'load-path "~/.emacs.d/lisp")
;;(add-to-list 'load-path "~/.emacs.d/iceberg-emacs-master/")
(load "indent-guide.el")
(load "swap-buffer.el")
(load "cmake-mode.el")


(indent-guide-global-mode)

;; Prohibit start up message
(setq inhibit-startup-message t)

;; Start with "view-mode"
(add-hook 'find-file-hook
          '(lambda ()
             (interactive)
             (view-mode)))

;;Line number 
(global-linum-mode t)

;;Column number
(column-number-mode t)

;;cursor blink
(blink-cursor-mode 0)

;;Cursor Highlight 
(global-hl-line-mode)
;;(custom-set-faces
;; '(hl-line ((t (:background "color-236"))))
;; )
(setq hl-line-face 'underline) 
;;about indentation
;;C, C++ 
(add-hook 'c-mode-hook
          (lambda () (c-set-style "stroustrup")))
(add-hook 'c++-mode-hook
          (lambda () (c-set-style "stroustrup")))

;;illuminate corresponding parensis
(show-paren-mode t)

;;delete
(if (fboundp 'global-hungry-delete-mode)
    (global-hungry-delete-mode 1))

(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))


;; view-minor-mode
(add-hook 'view-mode-hook
          '(lambda()
             (progn
               ;; C-b, 
               (define-key view-mode-map "h" 'backward-char)
               ;; C-n, 
               (define-key view-mode-map "j" 'next-line)
               ;; C-p, ↑
               (define-key view-mode-map "k" 'previous-line)
               ;; C-f, →
               (define-key view-mode-map "l" 'forward-char)
               )))


(require 'ansi-color)
;;(add-hook 'compilation-filter-hook
;;	  '(lambda ()
;;             (ansi-color-apply-on-region (point-min) (point-max))))



;;auto indent
(if (fboundp 'electric-indent-mode)
    (electric-indent-mode 1))
;;------ Back up file ------
;;execute or not
;;(setq make-backup-files t)

;;Directory to store backup files
;;(setq backup-directory-alist '((".*" > "~/.ehist")))

;;; -*- syntax: emacs-lisp; coding: iso-2022-jp-unix; -*-
(defun increase-font-size ()
  (interactive)
  (set-face-attribute 'default
		      nil
		      :height
		      (+ 10 (face-attribute 'default :height))))

(defun decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
		      nil
		      :height
		      ((lambda (h) (if (<= h 10) h (- h 10)))
		       (face-attribute 'default :height))))



(global-set-key [C-mouse-4] 'increase-font-size)
(global-set-key [C-wheel-up] 'increase-font-size)
(global-set-key [?\C-+] 'increase-font-size)
(global-set-key [?\C-\;] 'increase-font-size)

(global-set-key [C-mouse-5] 'decrease-font-size)
(global-set-key [C-wheel-down] 'decrease-font-size)
(global-set-key [?\C--] 'decrease-font-size)

;;(set-face-background 'indent-guide-face "dimgray")
