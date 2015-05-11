;; set search path
;(setq load-path (cons "/usr/share/emacs/20.6/lisp/" load-path))

;; display european accents
(standard-display-european 1)

;; info on buffer
;; line number should already be visible
(line-number-mode '1)
;; column number
(column-number-mode '1)
;; display time and load in 24h format
(display-time)
(setq display-time-24hr-format t)
(setq undo-limit 64000)

(define-key ctl-x-map [?r ?\C-\ ] 'rm-set-mark)
(define-key ctl-x-map "r\C-x" 'rm-exchange-point-and-mark)
(define-key ctl-x-map "r\C-w" 'rm-kill-region)
(define-key ctl-x-map "r\M-w" 'rm-kill-ring-save)
(define-key global-map [S-down-mouse-1] 'rm-mouse-drag-region)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
(autoload 'rm-mouse-drag-region "rect-mark"
  "Drag out a rectangular region with the mouse." t)
(global-set-key [(f3)] 'string-rectangle)
(global-set-key [(f4)] 'rm-kill-region)
;(global-set-key [(f5)] 'yank-rectangle)
;(global-set-key [(f6)] 'rm-kill-ring-save)
;(global-set-key (kbd "<f4>") 'find-tag-other-window)
;(global-set-key (kbd "<f5>") 'find-tag)
(global-set-key (kbd "<f9>") 'find-tag-other-window)
(global-set-key (kbd "<f8>") 'find-tag)
(global-set-key (kbd "<f5>") (kbd "C-u <f8>"))
(global-set-key (kbd "C-:") 'tags-search)
(global-set-key (kbd "<f6>") 'tags-loop-continue)

;(global-set-key (kbd "<f6>") (kbd "C-u <f8>"))
;(global-set-key (kbd "C-:") 'tags-search)
(global-set-key (kbd "C-c g")   'list-matching-lines)

(global-set-key [end] 'end-of-buffer)
(global-set-key [home] 'beginning-of-buffer)
(global-set-key [S-end] 'end-of-line)
(global-set-key [S-home] 'beginning-of-line)
(global-set-key [C-end] 'end-of-line)
(global-set-key [C-home] 'beginning-of-line)

;; replace 'lost' font menu
(define-key global-map [S-down-mouse-3] 'mouse-set-font)

;; customized leybindings
;(global-set-key [(f7)] 'compile)
;(global-set-key [(f8)] 'recompile)
(global-set-key [(f1)] 'indent-region)
(global-set-key [(f2)] 'speedbar-get-focus)
(global-set-key [(f10)] 'goto-line)
(global-set-key [(f11)] 'c++-mode)
(global-set-key [(f12)] 'font-lock-fontify-buffer)

(global-set-key [C-up] 'shrink-window)
(global-set-key [C-down] 'enlarge-window)
(global-set-key [C-left] 'shrink-window-horizontally)
(global-set-key [C-right] 'enlarge-window-horizontally)

;(global-set-key [mouse-4] 'previous-line)
;(global-set-key [mouse-5] 'forward-line)
(global-set-key [S-left] 'backward-word)
(global-set-key [S-right] 'forward-word)

(define-key-after (lookup-key global-map [menu-bar tools])
  [speedbar] '("Speedbar" . speedbar-frame-mode) [calendar])
(define-key-after (lookup-key global-map [menu-bar edit])
  [selectall] '("Select All" . mark-whole-buffer) [paste])

(if (string-match "21." emacs-version) (tool-bar-mode t))

;; names of window and icons
(setq frame-title-format  '("%b (%m) : " buffer-file-truename))
(setq icon-title-format   '("%b") )

;; wrap windows when cut vertically
(setq truncate-partial-width-windows nil)

(autoload 'vhdl-mode "vhdl-mode" "VHDL Editing Mode" t)
(setq auto-mode-alist (append '(("\\.vhd$"  . vhdl-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.vhdl$" . vhdl-mode)) auto-mode-alist))

(add-hook 'vhdl-mode-hook
          '(lambda ()
             (setq vhdl-electric nil)
             (setq vhdl-stutter t)
             (setq vhdl-compiler 'v-system)
             (setq vhdl-compiler-options "-explicit -quiet -nologo")
             (setq vhdl-underscore-is-part-of-word t)
             (setq vhdl-upper-case-keywords nil)
             (setq vhdl-basic-offset 4)
             (setq vhdl-comment-level 2)
             (setq comment-column 40)
             (setq end-comment-column 79)
             (setq vhdl-keywords-colorize t)
             (setq vhdl-signals-colorize nil)
             (setq vhdl-default-colors nil)
             (setq vhdl-print-two-column t)
             (setq vhdl-print-with-fonts t)
             (setq vhdl-print-with-colors nil)
             (setq font-lock-keywords-case-fold-search t)
             (setq vhdl-index-menu t)
             (setq vhdl-sourcefile-menu t)
             (setq vhdl-list-indent t)
             (setq vhdl-empty-lines t)
             (setq indent-tabs-mode nil)
             (setq vhdl-zero "'0'")
             (setq vhdl-one "'1'")
             (setq vhdl-date-scientific-format nil)
             ))


; Python mode
(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq font-lock-maximum-decoration t)

 (defun delete-trailing-space ()
   "Deletes trailing space from all lines in buffer."
   (interactive)
   (or buffer-read-only
       (save-excursion
         (message "Deleting trailing spaces ... ")
         (goto-char (point-min))
         (while (< (point) (point-max))
           (end-of-line nil)
           (delete-horizontal-space)
           (forward-line 1))
         (message "Deleting trailing spaces ... done.")))
   nil) ; indicates buffer-not-saved for write-file-hook
 (define-key ctl-x-map " " 'delete-trailing-space)

;;; Editor behavior: color tabs
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

(add-hook 'font-lock-mode-hook 
          (function (lambda ()
                      (setq font-lock-keywords
                            (append font-lock-keywords
                                    '(("\t+" (0 'my-tab-face t))
                                      ("[ \t]+$" (0 'my-trailing-space-face t))))))))


;; printing
(setq ps-landscape-mode t)
(setq ps-number-of-columns 2)
(setq ps-print-header-frame t)


;;
;; end
;;

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(case-fold-search t)
 '(current-language-environment "ASCII")
 '(delete-selection-mode t nil (delsel))
 '(global-font-lock-mode t nil (font-lock))
 '(gnuserv-program "/usr/lib/xemacs-21.0/i386-pc-linux/gnuserv")
 '(load-home-init-file t t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(tab-always-indent t)
 '(transient-mark-mode t))
 


(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)




(setq minibuffer-max-depth nil)
(setq load-path (cons (expand-file-name "~/scilabelisp") load-path))
(load "scilab-startup")



;(setq custom-file "~/emacs/emacs_custom.el")
;(load custom-file)
;(load "~/emacs/shortcut_custom.el")
