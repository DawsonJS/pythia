(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Comment out if you've already loaded this package...
(require 'cl-lib)

(defvar my-packages
  '(zenburn-theme org goto-chg undo-fu evil)
  "A list of packages to ensure are installed at launch.")

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
           when (not (package-installed-p p)) do (cl-return nil)
           finally (cl-return t)))

(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(require 'zenburn-theme)
(load-theme 'zenburn t)

(require 'org)
(require 'goto-chg)
(require 'undo-fu)
(require 'evil)
(evil-select-search-module 'evil-search-module 'evil-search)
(setq-default indent-tabs-mode nil)
(evil-mode 1)
(setq inhibit-startup-message t  ; Don't show the splash screen
      visible-bell t)            ; Flash when the bell rings

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
