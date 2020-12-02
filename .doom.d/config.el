(map! :leader
      :desc "Dired"
      "d d" #'dired
      :leader
      :desc "Dired jump to current"
      "d j" #'dired-jump
      (:after dired
        (:map dired-mode-map
         :leader
         :desc "Peep-dired image previews"
         "d p" #'peep-dired
         :leader
         :desc "Dired view file"
         "d v" #'dired-view-file)))
;; Make 'h' and 'l' go back and forward in dired. Much faster to navigate the directory structure!
(evil-define-key 'normal dired-mode-map
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-open-file) ; use dired-find-file instead if not using dired-open package
;; If peep-dired is enabled, you will get image previews as you go up/down with 'j' and 'k'
(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; With dired-open plugin, you can launch external programs for certain extensions
;; For example, I set all .png files to open in 'sxiv' and all .mp4 files to open in 'mpv'
(setq dired-open-extensions '(("gif" . "sxiv")
                              ("jpg" . "sxiv")
                              ("png" . "sxiv")
                              ("mkv" . "mpv")
                              ("mp4" . "mpv")))

(setq doom-theme 'doom-dracula)

;; (setq doom-font (font-spec :family "DejaVu Sans Mono" :size 16)
(setq doom-font (font-spec :family "SauceCodePro Nerd Font Mono" :size 16 :style 'Medium)
      doom-variable-pitch-font (font-spec :family "Ubuntu" :size 15)
      doom-big-font (font-spec :family "DejaVu Sans Mono" :size 24))

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; Show comments in italic
(custom-set-faces!
  '(font-lock-comment-face :slant italic))

(setq display-line-numbers-type 'relative)
(map! :leader
      :desc "Truncate lines"
      "t t" #'toggle-truncate-lines)

(after! neotree
  (setq neo-window-fixed-size nil))

(map! :leader
      :desc "Edit agenda file"
      "a" #'(lambda () (interactive) (find-file "~/org/agenda.org")))

(after! org
  (require 'org-bullets)
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/org/"
        org-capture-todo-file "~/org/agenda.org"
        org-agenda-files '("~/org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-hide-emphasis-markers t
        org-todo-keywords
          '((sequence
             "TODO(t)"          ; A task that is ready to be tackled
             "PROJ(p)"          ; Project with multiple task items
             "NEXT(n)"          ; Task is next to be worked on
             "STRT(s)"          ; Task is in progress
             "WAIT(w)"          ; Task is blocked or waiting for something/someone
             "|"                ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)")))       ; Task has been completed
)

(setq shell-file-name "/bin/bash"
      eshell-aliases-file "~/.doom.d/aliases"
      eshell-history-size 5000
      eshell-buffer-maximum-lines 5000
      eshell-hist-ignoredups t
      eshell-scroll-to-bottom-on-input t
      eshell-destroy-buffer-when-process-dies t
      eshell-visual-commands'("bash" "htop" "ssh" "zsh")
      vterm-max-scrollback 5000)
