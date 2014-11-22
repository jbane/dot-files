;; Packages
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; Random cruft
(tool-bar-mode -1)
(global-linum-mode)
(column-number-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t)
(setq-default frame-title-format "%b (%f)")
(setq initial-frame-alist '((top . 0) (left . 0) (width . 100) (height . 54)))


;; Mouse scrolling that doesn't suck so hard on a Mac trackpad
;; (hold shift to scroll slower, control to scroll faster)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
(setq ring-bell-function 'ignore)
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
			       (interactive)
			       (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
			       (interactive)
			       (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))


;; Clojure
;; https://github.com/flyingmachine/emacs-for-clojure.git
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "editing.el")
(load "navigation.el")
(load "elisp-editing.el")
(load "setup-clojure.el")


;;; Mac OS X uses launchctl
(defun set-exec-path()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used "
  "by the user's shell. This is particularly useful under Mac OSX, where GUI "
  "apps are not started from a shell."

  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\r\n]*$" ""
						   (shell-command-to-string
						    "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path)


;;; Themes
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(custom-theme-directory "~/.emacs.d/themes/"))
(custom-set-faces)

(load-theme 'solarized-light t)
;(load-theme 'solarized-dark t)

