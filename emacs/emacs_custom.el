;;; need to install emacs-goodies.el to have tabbar variable
;;; need to install cogre, cedet-common and cedet-contrib for programming studio

;; To remove "About Emacs" buffer at launching
;;  and so splitting of the xindow
(setq inhibit-splash-screen t)
;; To hide persistently the Tool-bar in Emacs
(tool-bar-mode -1)
;; Define user commands to copy, paste, cut protected from other selection
(defvar ud-registered-string nil "User defined variable : registered string")
(defun ud-cut (p1 p2)
  "Cut text selection."
  (interactive "r")
  (setq ud-registered-string (buffer-substring p1 p2))
  (kill-region p1 p2))
(defun ud-copy (p1 p2)
  "Copy text selection."
  (interactive "r")
  (setq ud-registered-string (buffer-substring p1 p2))
  (deactivate-mark))
(defun ud-paste (p1 p2)
  "Paste."
  (interactive "r")
  (if (region-active-p) (delete-region p1 p2))
  (insert ud-registered-string))
;; User key bindings
(global-set-key (kbd "C-c x") 'ud-cut)
(global-set-key (kbd "C-c c") 'ud-copy)
(global-set-key (kbd "C-c v") 'ud-paste)
(global-set-key (kbd "C-S-x") 'ud-cut)
(global-set-key (kbd "C-S-c") 'ud-copy)
(global-set-key (kbd "C-S-v") 'ud-paste)
;; Define user commands to set integer increment in columns
(defun ud-inc-rectangle (s1 i2 e3)
  "Integer increment in a column."
  (interactive "nStart :
nIncrement :
nEnd :")  
  (setq num s1)
  (setq col (current-column))
  (setq row (line-number-at-pos))
  (when (<= num e3)
    (insert (number-to-string num))
    (setq num (+ i2 num)))
  (while (<= num e3)
    (forward-line 1)
    (move-to-column col t)
    (insert (number-to-string num))
    (setq num (+ i2 num))
    ))
(defun ud-delete-region-inc-rectangle (p1 p2 s1 i2)
  "Delete rectangle region and integer increment in the remaining column."
  (interactive "r
nStart :  
nIncrement :")
  (setq rownb (count-lines p1 p2))
  (setq e3 (+ (* i2 (- rownb 1)) s1))
  (delete-rectangle p1 p2)
  (goto-char p1)
  (ud-inc-rectangle s1 i2 e3)
)
(global-set-key (kbd "C-c r i") 'ud-delete-region-inc-rectangle)
;(global-set-key (kbd "C-c C-f n") 'c-defun-name)
(global-set-key (kbd "C-c g")   'list-matching-lines)
(global-set-key (kbd "C-S-g")   'list-matching-lines)
(global-set-key (kbd "C-S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-S-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-S-<down>") 'enlarge-window)
(global-set-key (kbd "C-S-<up>") 'shrink-window)

(add-hook 'c-mode-common-hook 'cwarn-mode)

;; need to install cogre, cedet-common and cedet-contrib for programming studio
; programming studio : cedet
;(load-file "/usr/share/emacs/site-lisp/cedet-common/cedet.el")
;(global-ede-mode t)
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 


;obsolete lines thanks to cedet package
;;; Index menu (list of functions and classes for C) in menubar
(add-hook 'c-mode-common-hook 'imenu-add-menubar-index)
;;  Index menu in alphabetic order
(setq-default imenu-sort-function 'imenu--sort-by-name)


;; names of window and icons
(setq frame-title-format  '("%b : " buffer-file-truename))
;; use spaces intead of tabulation
(setq-default indent-tabs-mode nil)
;; need to install emacs-goodies.el to have tabbar variable
; tab buffers
(tabbar-mode t) ; pour avoir les onglets

(which-function-mode 1) ; indicates in which function you are

;;TAGS sensitive case
(set-default 'tags-case-fold-search nil)
