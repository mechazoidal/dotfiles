;;; Code:
; delete excess backup versions silently
(setq delete-old-versions -1 )
; use version control
(setq version-control t )
; make backups file even when in version controlled dir
(setq vc-make-backup-files t )
; which directory to put backups file
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")) ) 
; don't ask for confirmation when opening symlinked file
(setq vc-follow-symlinks t )
;transform backups file name
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)) ) 
; inhibit useless and old-school startup screen
(setq inhibit-startup-screen t )
; silent bell when you make a mistake
(setq ring-bell-function 'ignore )
; use utf-8 by default
(setq coding-system-for-read 'utf-8 )
(setq coding-system-for-write 'utf-8 )
; sentence SHOULD end with only a point.
(setq sentence-end-double-space nil)
; toggle wrapping text at the 80th character
;; (setq default-fill-column 80)
(setq fill-column 80)
; print a default message in the empty scratch buffer opened at startup
(setq initial-scratch-message "Welcome in Emacs")

; personal modifications

;; TODO OpenBSD ux305 screen
(set-face-attribute 'default nil :family "Inconsolata")
(set-face-attribute 'default nil :height 150)

(when (eq system-type 'darwin)
  ;; for other packaging systems / personal mods
  ;(add-to-list 'exec-path "/opt/local/bin")
  ;(add-to-list 'exec-path "~/Applications/bin")
  ;;(setq ack-executable (executable-find "/opt/local/bin/ack"))
  ;; default Latin font (e.g. Consolas)
  ;; Note that you CANNOT use the default 'inconsolata-dz' font, as Emacs' font-parser barfs on hyphens within font family names
  (set-face-attribute 'default nil :family "InconsolataDZ")
					; TODO must do system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 4") > 900
					; and use 140 if NOT over 900
					; https://www.emacswiki.org/emacs/ExecuteExternalCommand
					; shell-command
  (set-face-attribute 'default nil :height 170)
  )

; never use the toolbar
(tool-bar-mode -1)
(blink-cursor-mode 0)
(scroll-bar-mode -1)
(menu-bar-mode -1)
; end personal modifications
;(setq whitespace-style '(face trailing lines-tail tabs))

(require 'package)
(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize) 

;; Bootstrap `use-package'
; from melpa
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

; (eval-when-compile ; not required at runtime
;   (require 'use-package)) ; guess what this one does too ?
;; (use-package general :ensure t
;;   :config
;;   (general-define-key
;;    :states '(normal visual insert emacs)
;;    :prefix "SPC"
;;    :non-normal-prefix "C-SPC"

;;    ;; simple cmd
;;    "'" '(iterm-focus :which-key "iterm")
;;    "?" '(iterm-goto-filedir-or-home :which-key "iterm - goto dir")
;;    "/" 'counsel-ag
;;    "TAB" '(switch-to-other-buffer :which-key "prev buffer")
;;    "SPC" '(avy-goto-word-or-subword-1 :which-key "go to char")
;;    ;; apps
;;    "a" '(:ignore t :which-key "Applications")
;;    "ar" 'ranger
;;    "ad" 'dired))

(use-package avy :ensure t
  :commands (avy-goto-word-1))

(use-package counsel :ensure t)
(use-package swiper :ensure t)

; TODO see if baseline project.el suffices (along with counsel plugin for project.el)
; https://www.gnu.org/software/emacs/manual/html_node/emacs/Projects.html#Projects
; (use-package projectile :ensure t)
; (use-package counsel-projectile :ensure t)

(use-package which-key :ensure t :config (which-key-mode))
(use-package general :ensure t)
(general-define-key
 ;; replace default keybindings
 "C-s" 'swiper ; search for string in current buffer
 "M-x" 'counsel-M-x ; replace default M-x with ivy backend
 "C-t" 'counsel-M-x ; easier than using which-key?
 "C-x b" 'ivy-switch-buffer ; replace default C-x b with ivy backend
 "C-w" 'backward-kill-word ; like a terminal
 "C-x C-k" 'kill-region
 "C-c C-k" 'kill-region
 )

(general-define-key
 :prefix "C-c"
 ;; bind to simple key press
 "b" 'ivy-switch-buffer ; choose using ivy
 "/" 'counsel-git-grep ; find string in git
 "<left>" 'windmove-left
 "<right>" 'windmove-right
 "<up>" 'windmove-up
 "<down>" 'windmove-down
 ;; bind to double key press
 "f" '(:ignore t :which-key "files")
 "ff" '(counsel-find-file :which-key "find file")
 "fr" '(counsel-recentf :which-key "recent file")
 "p" '(:ignore t :which-key "project")
 ; "pf" '(counsel-projectile-find-file :which-key "find file in project")
 ; "pa" '(counsel-projectile-ag :which-key "find file in project with Ag")
 ; "pb" '(counsel-projectile-switch-to-buffer :which-key "switch to project buffer")
 ; "pp" '(counsel-projectile-switch-project :which-key "switch to project")
; "pf" '(counsel-git :which-key "find file in git dir")
; "pa" '(counsel-ag :which-key "find using Ag")
 ;; org-mode
 "o" (lambda () (interactive)(hydra-global-org/body))
 )
(use-package undo-tree :ensure t :config (global-undo-tree-mode))
(use-package magit :ensure t)
(use-package smex :ensure t :config (smex-initialize))

;; OSX specific. Not sure how memq differs from system-type!
(use-package exec-path-from-shell :ensure t
  :if (memq window-system '(mac ns))
  :config (exec-path-from-shell-initialize))

;(when (memq window-system '(mac ns))
;  (exec-path-from-shell-initialize))

;;; Theme hooks
;;; http://www.greghendershott.com/2017/02/emacs-themes.html
(defun gh/disable-all-themes ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))

(defvar gh/theme-hooks nil
  "((theme-id . function) ...)")

(defun gh/add-theme-hook (theme-id hook-func)
  (add-to-list 'gh/theme-hooks (cons theme-id hook-func)))

(defun gh/load-theme-advice (f theme-id &optional no-confirm no-enable &rest args)
  "Enhances `load-theme' in two ways:
1. Disables enabled themes for a clean slate.
2. Calls functions registered using `gh/add-theme-hook'."
  (unless no-enable
    (gh/disable-all-themes))
  (prog1
      (apply f theme-id no-confirm no-enable args)
    (unless no-enable
      (pcase (assq theme-id gh/theme-hooks)
        (`(,_ . ,f) (funcall f))))))

(advice-add 'load-theme
            :around
            #'gh/load-theme-advice)

(use-package zenburn-theme
             :ensure zenburn-theme
             :defer t
             :init
             (defun gh/zenburn-theme-hook ()
              ;(set-face-attribute 'default nil :family "InconsolataDZ")
; TODO must do system("osascript -e 'tell application \"Finder\" to get bounds of window of desktop' | cut -d ' ' -f 4") > 900
; and use 140 if NOT over 900
; https://www.emacswiki.org/emacs/ExecuteExternalCommand
              ;(set-face-attribute 'default nil :height 170)
               )
             (gh/add-theme-hook 'zenburn #'gh/zenburn-theme-hook))

(use-package solarized
             :ensure solarized-theme
             :defer t
             :init
             (defun gh/solarized-theme-hook ()
              ;(set-face-attribute 'default nil :family "InconsolataDZ")
              ;(set-face-attribute 'default nil :height 140)
               )
             (gh/add-theme-hook 'solarized #'gh/solarized-theme-hook))

(use-package hydra
  :ensure t
  :config
  (setq hydra-lv nil) ;use echo area
  )
(defhydra gh/themes-hydra (:hint nil :color pink)
"
Themes

^Solarized^   ^Other^
----------------------------------------------------
_s_: std     _z_: Zenburn  _DEL_: none

"
          ("z" (load-theme 'zenburn t))
          ("s" (load-theme 'solarized t))
          ("DEL" (gh/disable-all-themes))
          ("RET" nil "done" :color blue))
(bind-keys ("C-c w t" . gh/themes-hydra/body))
(load-theme 'zenburn t)
;; end theme setup

;; org-mode setup
;; not sure if this will fully install org? sometimes list-packages says it has a version number as part of package
;; should default to "~/org" for storage
(use-package org :ensure t :pin org)
;; (setq org-default-notes-file (expand-file-name "~/org/notes.org"))
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; https://github.com/abo-abo/hydra/wiki/orgmode
(defhydra hydra-global-org (:color blue)
  "Org"
  ("t" org-timer-start "Start Timer")
  ("s" org-timer-stop "Stop Timer")
  ("r" org-timer-set-timer "Set Timer") ; This one requires you be in an orgmode doc, as it sets the timer for the header
  ("p" org-timer "Print Timer") ; output timer value to buffer
  ("w" (org-clock-in '(4)) "Clock-In") ; used with (org-clock-persistence-insinuate) (setq org-clock-persist t)
  ("o" org-clock-out "Clock-Out") ; you might also want (setq org-log-note-clock-out t)
  ("j" org-clock-goto "Clock Goto") ; global visit the clocked task
  ("c" org-capture "Capture") ; Don't forget to define the captures you want http://orgmode.org/manual/Capture.html
  ("l" org-capture-goto-last-stored "Last Capture"))

;;; from abo-abo's org-mode setup
;; (defhydra hydra-org-agenda-ex (:color blue :columns 2)
;;   "x"
;;   ("a" org-agenda-archive-default-with-confirmation "archive")
;;   ("b" org-agenda-earlier "earlier")
;;   ("c" org-agenda-goto-calendar "calendar")
;;   ("e" org-agenda-set-effort "effort")
;;   ("h" org-agenda-holidays "holidays")
;;   ("i" org-agenda-diary-entry "diary entry")
;;   ("j" org-agenda-goto-date "goto date")
;;   ("k" org-agenda-capture "capture")
;;   ("l" org-agenda-log-mode "log-mode")
;;   ("o" delete-other-windows "one window")
;;   ("r" org-agenda-redo "redo")
;;   ("u" org-agenda-bulk-unmark "unmark")
;;   ("z" org-agenda-add-note "note"))
;;* Basic settings
(setq-default org-todo-keywords
              '((sequence "TODO(t)"
                 "BLOCKED(b@/!)"
                 ;; "NEXT"
                 "|" "DONE(d!)" "CANCELLED(c@)")))
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red" :weight bold))
        ("WAITING" . (:foreground "blue" :weight bold))))
(setq org-return-follows-link nil)
(setq org-startup-indented t)
(setq org-startup-folded nil)
(setq org-cycle-separator-lines 0)
(setq org-return-follows-link t)
;; (setq org-bookmark-names-plist
;;       '(:last-capture "jc:  org-last-capture"
;;         :last-refile "jr:  org-last-refile"))
;; (setq org-refile-targets
;;       '((nil :maxlevel . 3)
;;         (org-agenda-files :maxlevel . 3)))
;;(setq-default org-tags-column -96)
(setq org-completion-use-ido t)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-clock-string-limit 30)
;;* Agenda settings
(setq org-agenda-span 'day)
(setq org-agenda-remove-tags t)
(setq org-agenda-files (list "~/org/diary.org" "~/org/refile.org" "~/org/projects.org"))
;; templates
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/org/refile.org")
	       "* TODO %?\n%U\n%a\n")
	      ("j" "Journal" entry (file+datetree "~/org/diary.org")
	       "* %?\n%U\n")
					; don't remember what this template was for 
					;("w" "org-protocol" entry (file "~/org/refile.org")
					;                "* TODO Review %i\n%U\n" :immediate-finish t)
	      ("p" "Phone call" entry (file "~/org/refile.org")
	       "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
	      ("n" "Note" entry (file "~/org/refile.org")
	       "* NOTE %? :NOTE:\n")
					; don't remember what this was for either
					;("u" "URL" entry (file "~/org/refile.org")
					; "* %c \"%i\"")
	      )))

;; helm
(use-package helm :disabled)

;; http://jonathanchu.is/posts/setting-up-deft-mode-in-emacs-with-org-mode/
(use-package deft :ensure t
  :config (setq deft-directory "~/org")
  (setq deft-extension "org")
  (setq deft-text-mode 'org-mode)
  (setq deft-use-filename-as-title t))

;; https://github.com/technomancy/better-defaults
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(show-paren-mode 1)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(setq require-final-newline t
      apropos-do-all t
      visible-bell t
      )

(use-package flycheck :ensure t
  :pin melpa-stable
  :config (global-flycheck-mode))

(use-package yasnippet :ensure t
  ;; TODO move each language into a separate module to load yas-minor-mode in each
  :config 'sh-mode-hook #'yas-minor-mode)

;; (use-package emmit-mode :ensure t)

;; END
;; (anything after here was added by Custom)

