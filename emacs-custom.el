(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Man-width 100)
 '(backup-directory-alist (quote (("." . "/home/jsynacek/emacsbackup"))))
 '(c-macro-prompt-flag t)
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(diff-switches "-u")
 '(dired-dwim-target t)
 '(dired-hide-details-hide-symlink-targets nil)
 '(dired-listing-switches "-al --group-directories-first")
 '(dired-use-ls-dired t)
 '(ediff-custom-diff-options "-up")
 '(ediff-diff-options "")
 '(fill-column 80)
 '(git-commit-summary-max-length 79)
 '(global-auto-revert-mode t)
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (find-tag . helm-completing-read-with-cands-in-buffer)
     (ffap-alternate-file)
     (tmm-menubar)
     (find-file))))
 '(ido-case-fold nil)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-save-directory-list-file "/home/jsynacek/.emacs.d/.ido.last")
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-virtual-buffers t)
 '(ido-work-directory-list-ignore-regexps (quote (".*")))
 '(indent-tabs-mode nil)
 '(kill-ring-max 1024)
 '(magit-diff-refine-hunk t)
 '(mark-even-if-inactive t)
 '(max-lisp-eval-depth 6000)
 '(max-specpdl-size 13000)
 '(mouse-yank-at-point t)
 '(next-screen-context-lines 4)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(recentf-exclude (quote ("/tmp/")) t)
 '(recentf-save-file "/home/jsynacek/.emacs.d/.recentf")
 '(save-place-file "~/.emacs.d/places")
 '(scroll-preserve-screen-position 1)
 '(show-paren-mode t)
 '(smex-save-file "~/.emacs.d/.smex-items")
 '(split-height-threshold nil)
 '(split-width-threshold 160)
 '(tramp-default-method "ssh")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(whitespace-style
   (quote
    (face tabs spaces trailing lines newline empty space-after-tab space-mark tab-mark newline-mark)))
 '(woman-fill-column 80))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
