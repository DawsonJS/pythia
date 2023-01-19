(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'load-path "~/.emacs.d")

(require 'org)
(require 'goto-chg)
(require 'undo-fu)
(require 'evil)
(setq-default indent-tabs-mode nil)
(evil-mode 1)
(setq inhibit-startup-message t  ; Don't show the splash screen
      visible-bell t)            ; Flash when the bell rings
