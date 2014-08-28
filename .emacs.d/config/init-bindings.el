;;; package -- Summary
;;; Commentary:
;;; Code:
(after 'evil
       ;; fix conflict with electric-indent-mode in 24.4
       (define-key evil-insert-state-map [remap newline] 'newline)
       (define-key evil-insert-state-map [remap newline-and-indent] 'newline-and-indent)
       (after "evil-leader-autoloads"
	      (evil-leader/set-leader "<SPC>")
	      (evil-leader/set-key
		"f" 'find-file
		"g s" 'magit-status
		"g b" 'magit-blame-mode
		"g c" 'magit-commit
		"g l" 'magit-log))
       (after "smex-autoloads"
	      (define-key evil-visual-state-map (kbd "SPC x") 'smex)
	      (define-key evil-normal-state-map (kbd "SPC x") 'smex))
       (after "helm-autoloads"
	 (define-key evil-normal-state-map (kbd "SPC SPC") 'helm-mini)
	 (define-key evil-normal-state-map (kbd "SPC f") 'helm-find-files)
	 (define-key evil-normal-state-map (kbd "SPC b") 'helm-bookmarks))
       (after "projectile-autoloads"
	      (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file))
       (after "evil-args-autoloads"
	      (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
	      (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)))

(provide 'init-bindings)
;;; init-bindings.el ends here
