(electric-indent-mode 1)

(require-package 'exec-path-from-shell)

;; Copy $MANPATH, $PATH, and exec-path from shell in OSX
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq backup-directory-alist `(("." . "~/.backups-emacs")))

;; No bells
(setq ring-bell-function 'ignore)

(setq c-basic-offset 2)
(setq tab-width 2)
(setq indent-tabs-mode nil)

;; move cursor to the last position upon open
(require 'saveplace)
(setq save-place-file (concat dotemacs-cache-directory "places"))
(setq-default save-place t)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'init-core)
