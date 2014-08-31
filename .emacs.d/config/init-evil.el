(require-package 'evil)
(require-package 'evil-leader)
(require-package 'evil-nerd-commenter)
(require-package 'evil-indent-textobject)
(require-package 'evil-matchit)
(require-package 'evil-surround)
(require-package 'evil-args)

(require 'evil)
(require 'evil-nerd-commenter)
(require 'evil-indent-textobject)

(evil-mode 1)

(global-evil-leader-mode)
(global-evil-surround-mode 1)
;; (evilnc-default-hotkeys)
(global-evil-matchit-mode 1)

(provide 'init-evil)
