(electric-indent-mode +1)

(require-package 'exec-path-from-shell)

;; Copy $MANPATH, $PATH, and exec-path from shell in OSX
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq backup-directory-alist `(("." . "~/.backups-emacs")))

(provide 'init-core)
