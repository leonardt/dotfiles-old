(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

(defun require-package (package)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(unless (display-graphic-p) (menu-bar-mode -1))
(blink-cursor-mode -1)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(if (eq system-type 'darwin)
    (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta))

(recentf-mode 1)

(setq backup-directory-alist `(("." . "~/.saves")))

(require-package 'helm)
(require 'helm-config)
(helm-mode 1)


;; (require-package 'flx)
;; (require-package 'flx-ido)
;; (require 'flx-ido)
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)
;; ;; disable ido faces to see flx highlights.
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-faces nil)

(require-package 'smartparens)
(require 'smartparens-config)
(setq sp-autoskip-closing-pair 'always)
(show-smartparens-global-mode t)
(smartparens-global-mode t)

(setq-default indent-tabs-mode nil)

(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require-package 'evil)
(evil-mode 1)

(require-package 'evil-jumper)
(require 'evil-jumper)

(require-package 'evil-args)
(require 'evil-args)

(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

(require-package 'evil-surround)
(global-evil-surround-mode t)

(require-package 'evil-leader)
(global-evil-leader-mode)

(setq evilnc-hotkey-comment-operator "gc")
(require-package 'evil-nerd-commenter)
(require 'evil-nerd-commenter)

(require-package 'evil-snipe)
(global-evil-snipe-mode 1)

(evil-snipe-replace-evil)


(require-package 'magit)

;; projectile
(require-package 'projectile)
(projectile-global-mode)

;; yasnippet
(require-package 'yasnippet)
(yas-global-mode 1)

(require-package 'company)
(require 'company)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
(setq company-tooltip-limit 20)

(defadvice company-complete-common (around advice-for-company-complete-common activate)
  (when (null (yas-expand))
    ad-do-it))

(defun my-company-tab ()
  (interactive)
  (when (null (yas-expand))
    (company-select-next)))

(global-company-mode)
(define-key company-active-map (kbd "<tab>") 'my-company-tab)

(require-package 'geiser)
(require-package 'aggressive-indent)
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'geiser-mode-hook #'aggressive-indent-mode)

(require-package 'ycmd)
(set-variable 'ycmd-server-command '("python" "/Users/leonardtruong/dev/projects/ycmd/ycmd"))
(ycmd-setup)
(require-package 'company-ycmd)
(company-ycmd-setup)
;; (require-package 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'eldoc-mode)
;; (require-package 'company-anaconda)
;; (add-to-list 'company-backends 'company-anaconda)
;; (eval-after-load 'python '(semantic-mode 1))

(require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(require-package 'tern)
(require-package 'company-tern)
(add-to-list 'company-backends 'company-tern)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(require-package 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; (require-package 'smex)
;; (smex-initialize)

(evil-leader/set-leader "<SPC>")

(require-package 'shell-pop)

(setq shell-pop-window-position "bottom"
      shell-pop-window-height 50
      shell-pop-universal-key "C-z"
      shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))

(define-key evil-normal-state-map (kbd "C-z") 'shell-pop)
(define-key evil-insert-state-map (kbd "C-z") 'shell-pop)
(global-set-key (kbd "C-z") 'shell-pop)


(evil-leader/set-key
  "x" 'helm-M-x
  "c" 'compile
  "r" 'recompile
  "b" 'ido-switch-buffer
  "f" 'ido-find-file
  "e s" 'eshell
  "g s" 'magit-status
  "g p s" 'magit-push
  "g p l" 'magit-pull
  "g c" 'magit-commit
  "p s" 'projectile-switch-project)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)
(require-package 'projectile)
(projectile-global-mode)

(require-package 'gotham-theme)
(require-package 'zenburn-theme)
(load-theme 'gotham t)
(add-to-list 'default-frame-alist
             '(font . "Akkurat-Mono-11"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("30a8a5a9099e000f5d4dbfb2d6706e0a94d56620320ce1071eede5481f77d312" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
