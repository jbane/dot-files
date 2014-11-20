;;; This prevents errors loading themes (among other issues)
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(tool-bar-mode -1)
(column-number-mode t)

;(require 'ido-mode)
(ido-mode t)

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
    ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(custom-theme-directory "~/.emacs.d/themes/"))
(custom-set-faces)

;(load-theme 'solarized-light t)
(load-theme 'solarized-dark t)
