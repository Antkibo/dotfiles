;;; -*- lexical-binding: t; -*-

(load-file (concat user-emacs-directory
                   "help.el"))

(set-face-font 'default
               "Iosevka:size=14")

(enable-mode! electric-pair)
(enable-mode! cua)
(enable-mode! global-visual-line)
(enable-mode! ido)

(disable-mode! tool-bar)
(disable-mode! menu-bar)
(disable-mode! scroll-bar)

;; inhibit
(setq inhibit-splash-screen t)

(disable! make-backup-files)
(disable! create-lockfile)

(setq-default indent-tabs-mode nil)

(add-hook! prog-mode (global-display-line-numbers-mode t))

(set-background-color "#1c1c1c")
(set-foreground-color "#cccccc")



