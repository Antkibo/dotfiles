;; -*- lexical-binding: t -*-
;; init.el -- Humberto's Emacs configuration

;; Author: Humberto Rondon <hxd.1996@gmail.com>
;; Copyright (C) 2021 Humberto Rondon

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;

;; COMMON                                        ;;

;; this section is for global changes            ;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;

;; inhibit
(setq inhibit-splash-screen t)               ;; splash screen
(setq byte-compile-warnings '(cl-functions)) ;; cl package warning
(setq make-backup-files nil)                 ;; backup files
(setq-default indent-tabs-mode nil)          ;; tabs
(setq create-lockfiles nil)                  ;; lockfiles (to avoid problems with React)

;; More screen space
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Line numbers only on programming modes
;; to avoid problems with packages like pdf-tools
(add-hook 'prog-mode-hook
	  (global-display-line-numbers-mode t))

;; Wrap text
(global-visual-line-mode t)

;; Something something lsp-mode
(setq gc-cons-threshold 100000000)

;; 1mb
(setq read-process-output-max (* 1024 1024))

;; Better autocomplete
(ido-mode t)

;; Autocomplete parentheses, quotes, etc.
(electric-pair-mode t)

;; TODO: Add why
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)
  
;; Make MELPA available
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("81c3de64d684e23455236abde277cda4b66509ef2c28f66e059aa925b8b12534" default))
 '(package-selected-packages
   '(go-mode zig-mode treemacs swiper ivy impatient-mode simple-httpd lsp-mode projectile flycheck company rainbow-mode emmet-mode web-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#282a36" :foreground "#f8f8f2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "PfEd" :family "Liberation Mono")))))

(eval-when-compile
  (require 'use-package))

(use-package dracula-theme
  :ensure t
  :config (load-theme 'dracula))

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'"
         "\\.css\\'"
         "\\.js\\'")
  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent offset 4)
  :init
  (add-hook 'web-mode-hook (lambda ()
                             (if (equal web-mode-content-type "javascript")
                                 (web-mode-set-content-type "jsx")))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;

;; web                                           ;;

;; html, css, js, and React stuff                ;;

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'web-mode-hook 'emmet-mode)
  (setq emmet-self-closing-tag-style " /") 
  (setq emmet-move-cursor-between-quotes t)
  :init
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))))

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'web-mode-hook 'rainbow-mode))


(use-package lsp-mode
  :ensure t)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.1)
  (add-to-list 'company-backends 'company-css)
  (add-to-list 'company-backends 'company-capf))

(use-package flycheck
  :ensure t)

(use-package projectile
  :ensure t)

(use-package simple-httpd
  :ensure t
  :config
  (setq httpd-root "/home/sauron/public"))

(use-package impatient-mode
  :ensure t)

(use-package ivy
  :ensure t)

(use-package swiper
  :ensure t)

(use-package treemacs
  :ensure t)

(use-package org
  :config
  (setq org-hide-emphasis-markers t))

(use-package zig-mode
  :ensure t)

(use-package go-mode
  :ensure t)

(defun go-save-and-run-buffer ()
  (interactive)
  (save-some-buffers t)
  (async-shell-command (concat "go run " (buffer-name))))

(global-set-key (kbd "C-c C-c") 'go-save-and-run-buffer)
