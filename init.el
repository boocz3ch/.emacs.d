;;; general
(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))
(add-to-list 'load-path "~/work/git/upstream/org-mode/contrib/lisp/") ; org-notmuch.el

(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq smex-save-file "~/.emacs.d/.smex-items")

(setq tramp-default-method "ssh")
(setq send-mail-function 'smtpmail-send-it)

;;; ui
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area t)
(setq initial-scratch-message nil)

(blink-cursor-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode t)
(abbrev-mode t)
(recentf-mode t)

(setq ring-bell-function 'ignore)
(prefer-coding-system 'utf-8)

(setq Man-width 90)

(defun jsynacek-highlight-trailing-whitespace ()
  (setq-local show-trailing-whitespace t))
(add-hook 'find-file-hook #'jsynacek-highlight-trailing-whitespace)

(global-unset-key (kbd "C-z")) ; no suspend

;;; editing
(setq global-auto-revert-mode t)
(setq mouse-yank-at-point t)

(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'plp 'package-list-packages)
(defalias 'yes-or-no-p 'y-or-n-p)

(defun jsynacek-ggtags-mode ()
  (ggtags-mode 1))
(add-hook 'c-mode-hook #'jsynacek-ggtags-mode)

(defadvice eval-region (after jsynacek-eval-region-advice-after activate)
  (deactivate-mark))

;;; packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(require 'ace-jump-mode)
;; (require 'bbdb)
;; (bbdb-initialize 'message)
;; (bbdb-mua-auto-update-init 'message)
;; (setq bbdb-update-records-p 'create)

(require 'dired)
(setq dired-listing-switches "-al --group-directories-first")
(require 'dired-x)

(require 'elfeed)
(define-key elfeed-search-mode-map "i"
  (lambda ()
    (interactive)
    (goto-line 2)))
(define-key elfeed-search-mode-map "k" 'elfeed-search-untag-all-unread)
(define-key elfeed-search-mode-map "r" nil)

(require 'erc)
(setq erc-nick-uniquifier "_")
(setq erc-current-nick-highlight-type 'nick)
(setq erc-track-exclude-types '("JOIN" "KICK" "MODE" "NICK" "PART" "QUIT"))
(setq erc-hide-timestamps nil)
(setq erc-fill-function #'erc-fill-static)
(setq erc-fill-static-center 15)
(setq erc-fill-column 90)

(add-to-list 'erc-modules 'notifications)
(define-key erc-mode-map (kbd "RET") nil)
(define-key erc-mode-map (kbd "C-<return>") 'erc-send-current-line)

(require 'expand-region)
(global-set-key (kbd "M-n") 'er/expand-region)
(setq expand-region-contract-fast-key "N")

(require 'helm)
;; (helm-mode t)
;; (add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
;; (add-to-list 'helm-completing-read-handlers-alist '(find-file-other-window . nil))
;; (add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))
;; (add-to-list 'helm-completing-read-handlers-alist '(kill-buffer . nil))

(require 'helm-git-grep)
(global-set-key (kbd "M-s M-g") 'helm-git-grep)

(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-use-url-at-point t)
(setq ido-auto-merge-work-directories-length -1)

(require 'magit)
(setq magit-auto-revert-mode-lighter nil)
; kill magit windows when quitting
(define-key magit-mode-map "q" #'(lambda ()
				   (interactive)
				   (magit-mode-quit-window t)))

(require 'notmuch)
(setq notmuch-search-oldest-first nil)
(setq notmuch-fcc-dirs "Sent")
(setq notmuch-show-logo nil)

(defun jsynacek-notmuch-mark-read-and-archive ()
  (interactive)
  (notmuch-search-tag '("-unread"))
  (notmuch-search-archive-thread))
(define-key notmuch-search-mode-map "k" 'jsynacek-notmuch-mark-read-and-archive)
(defun jsynacek-notmuch-search-unread ()
  (interactive)
  (notmuch-hello-search "tag:unread"))
(define-key notmuch-hello-mode-map "u" 'jsynacek-notmuch-search-unread)
(defun jsynacek-notmuch-search-inbox ()
  (interactive)
  (notmuch-hello-search "tag:inbox"))
(define-key notmuch-hello-mode-map "i" 'jsynacek-notmuch-search-inbox)

(require 'org)
(setq org-agenda-files '("~/SpiderOak Hive/orgfiles/inbox.org.gpg"
                         "~/SpiderOak Hive/orgfiles/birthday.org"))
(setq org-default-notes-file "~/SpiderOak Hive/orgfiles/inbox.org.gpg")
(setq org-capture-templates '(("t" "New item into Inbox" entry
			       (file org-agenda-files)
			       "** %?\n   added:%U" :empty-lines-after 1)))
(setq org-catch-invisible-edits 'show-and-error)
(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)")))
(setq org-clock-out-when-done t)
(setq org-agenda-span 14)
(setq org-agenda-start-on-weekday nil)

(require 'org-notmuch)

;; (require 'solarized)
;; (setq solarized-use-variable-pitch nil)
;; (setq custom-safe-themes
;;       '("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))
;; (load-theme 'solarized-light)
;; (load-theme 'warm-night)

(require 'recentf)
(setq recentf-max-saved-items 50)

(require 'smartparens-config)
(smartparens-global-strict-mode t)
(show-smartparens-global-mode t)
(sp-local-pair 'message-mode "'" nil :actions nil)
(sp-local-pair 'c-mode "/*" "*/") sp-point-inside-string
(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)
(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
(define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-k") 'sp-kill-hybrid-sexp)
(define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
(define-key sp-keymap (kbd "M-0") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "M-9") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "M-(") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "M-)") 'sp-backward-barf-sexp)

(require 'undo-tree)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(load "jsynacek-util.el")
(require 'private)


;;; keybindings
; basic
(global-set-key [remap list-buffers] 'ibuffer)
(defun jsynacek-find-file (arg)
  (interactive "P")
  (if current-prefix-arg
      (find-file (ido-completing-read "Open recent: "
				      (recentf-elements recentf-max-saved-items)))
    (call-interactively #'find-file)))
;; (global-set-key (kbd "C-o") 'jsynacek-find-file) ; was open-line
;; (global-set-key (kbd "C-b") 'switch-to-buffer) ; was backward-char
;; (global-set-key (kbd "C-w") 'jsynacek-kill-current-buffer) ; was kill-region
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key (kbd "<f2>") 'save-buffer)
(global-set-key (kbd "M-2") 'delete-window)
(global-set-key (kbd "M-3") 'delete-other-windows)
(global-set-key (kbd "M-4") 'switch-to-buffer-other-window)
(global-set-key (kbd "M-5") 'find-file-other-window)
(global-set-key (kbd "M-7") #'(lambda () (interactive) (scroll-down (/ (- (window-height) 2) 2))))
(global-set-key (kbd "M-8") #'(lambda () (interactive) (scroll-up (/ (- (window-height) 2) 2))))
(global-set-key (kbd "M-\\") 'fixup-whitespace) ; was delete-horizontal-space
(global-set-key (kbd "M-/") 'hippie-expand) ; was dabbrev-expand
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "<f5>") (if (fboundp 'helm-M-x)
				  'helm-M-x
				'execute-extended-command))
(global-set-key (kbd "M-x") 'jsynacek-kill-line-or-region)
(global-set-key (kbd "M-c") 'jsynacek-copy-line-or-region) ; was capitalize-word
(global-set-key (kbd "M-C") 'jsynacek-duplicate-line)
(global-set-key (kbd "M-v") 'jsynacek-yank) ; was scroll-down
(define-key minibuffer-local-completion-map (kbd "M-v") 'jsynacek-yank)
(global-set-key (kbd "M-z") 'undo-tree-undo) ; was zap-to-char
(global-set-key (kbd "M-Z") 'undo-tree-redo)
(global-set-key (kbd "M-,") 'ace-jump-mode) ; was indent-new-comment-line
(global-set-key (kbd "M-y") 'helm-show-kill-ring) ; was yank-pop
(global-set-key (kbd "<f1> a") 'helm-apropos)      ; was apropos-command
(global-set-key (kbd "<f1> l") 'helm-locate-library) ; was view-lossage
(global-set-key (kbd "<f1> n") 'man)		     ; was view-emacs-news
(global-set-key (kbd "<f1> M") 'helm-man-woman)
; movement
(global-set-key (kbd "M-i") 'previous-line) ; was tab-to-tab-stop
(global-set-key (kbd "M-I") 'scroll-down)
(global-set-key (kbd "M-j") 'backward-char) ; was indent-new-comment-line
(global-set-key (kbd "M-k") 'next-line) ; was kill-sentence
(global-set-key (kbd "M-K") 'scroll-up)
(global-set-key (kbd "M-l") 'forward-char) ; was downcase-region
(global-set-key (kbd "M-o") 'forward-word) ; was "set face to something"
(global-set-key (kbd "M-O") 'forward-paragraph)
(global-set-key (kbd "M-u") 'backward-word) ; was upcase-word
(global-set-key (kbd "M-U") 'backward-paragraph)
; selection
(define-prefix-command 'jsynacek-selection-map)
(global-set-key (kbd "M-;") 'jsynacek-selection-map)
(global-set-key (kbd "M-; o") 'er/mark-word)
(global-set-key (kbd "M-; O") 'er/mark-paragraph)
(global-set-key (kbd "M-; k") 'jsynacek-mark-line) ; TODO this seems really not needed
; windows
(define-prefix-command 'jsynacek-window-keymap)
(global-set-key (kbd "M-w") 'jsynacek-window-keymap)
(global-set-key (kbd "M-w i") 'windmove-up)
(global-set-key (kbd "M-w j") 'windmove-left)
(global-set-key (kbd "M-w k") 'windmove-down)
(global-set-key (kbd "M-w l") 'windmove-right)
; evaluation
(define-prefix-command 'jsynacek-eval-keymap)
(global-set-key (kbd "M-e") 'jsynacek-eval-keymap)
(global-set-key (kbd "M-e M-e") 'eval-last-sexp)
(global-set-key (kbd "M-e b") 'eval-buffer)
(global-set-key (kbd "M-e d") 'eval-defun)
(global-set-key (kbd "M-e e") 'eval-last-sexp)
(global-set-key (kbd "M-e r") 'eval-region)
; transposition
(define-prefix-command 'jsynacek-transpose-keymap)
(global-set-key (kbd "M-t") 'jsynacek-transpose-keymap)
(global-set-key (kbd "M-t t") 'transpose-chars)
(global-set-key (kbd "M-t M-t") 'transpose-chars)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t l") 'transpose-lines)
; searching
(global-set-key (kbd "M-s g") 'rgrep)
(global-set-key (kbd "M-s s") 'helm-swoop)
; inserting
(define-prefix-command 'jsynacek-todo-keymap)
(global-set-key (kbd "M-m") 'jsynacek-todo-keymap) ; was back-to-indentation
(global-set-key (kbd "M-m o") 'jsynacek-open-below)
(global-set-key (kbd "M-m O") 'jsynacek-open-above)
; code navigation
(global-set-key (kbd "M-m r") 'ggtags-find-reference)
(global-set-key (kbd "M-m f") 'ggtags-find-tag-dwim)
(global-set-key (kbd "M-m e") 'helm-semantic-or-imenu)
; mail
(global-set-key (kbd "M-m m m") 'jsynacek-mail-get)
(global-set-key (kbd "M-m m s") 'jsynacek-mail-send)
; org
(global-set-key (kbd "M-m i l") 'org-store-link)
(global-set-key (kbd "M-m i a") 'org-agenda)
(global-set-key (kbd "M-m i c") 'org-capture)
; apps
(global-set-key (kbd "M-m a a") 'magit-status)
(global-set-key (kbd "M-m a m") 'notmuch)
(global-set-key (kbd "M-m a s") 'shell)
(global-set-key (kbd "M-m a p") 'proced)
; comments
(global-set-key (kbd "M-m ; ;") 'jsynacek-comment-line-or-region)
; buffer
(global-set-key (kbd "M-m b b") 'switch-to-buffer)
(global-set-key (kbd "M-m b r") 'revert-buffer)
(global-set-key (kbd "M-m b k") 'jsynacek-kill-current-buffer)
; file and bookmarks
(global-set-key (kbd "M-m g b") 'helm-bookmarks)
(global-set-key (kbd "M-m g g") 'jsynacek-find-file)
(global-set-key (kbd "M-m g v") 'find-alternate-file)
(global-set-key (kbd "M-m g d") 'dired)
; version control
(global-set-key (kbd "M-m v l") 'magit-log)

;;; enable "dangerous" commands
(put 'dired-find-alternate-file 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
