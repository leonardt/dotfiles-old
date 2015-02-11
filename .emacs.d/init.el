(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b458d10c9ea0c8c465635b7b13e1bd23f04e6b696b1ca96cb2c4eca35a31641e" "013e87003e1e965d8ad78ee5b8927e743f940c7679959149bbee9a15bd286689" "9eb5269753c507a2b48d74228b32dcfbb3d1dbfd30c66c0efed8218d28b8f0dc" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(elpy-test-runner (quote elpy-test-nose-runner))
 '(magit-use-overlays nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

(package-initialize)

(defun require-package (package)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;; tramp, for sudo access
(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")

(server-start)
(setenv "EDITOR" "emacsclient")

(fset 'yes-or-no-p 'y-or-n-p)

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(unless (display-graphic-p) (menu-bar-mode -1))
(blink-cursor-mode -1)
(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)

(require-package 'flx)
(require-package 'flx-ido)
(require-package 'ido-vertical-mode)
(require-package 'ido-ubiquitous)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(ido-vertical-mode 1)
(ido-ubiquitous-mode 1)

(require 'recentf)

(recentf-mode t)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(require-package 'smartparens)
(require 'smartparens-config)
(setq sp-autoskip-closing-pair 'always)
(show-smartparens-global-mode t)
(smartparens-global-mode t)

(setq-default indent-tabs-mode nil)

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
(evil-leader/set-leader "<SPC>")

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

(require-package 'shell-pop)

(setq shell-pop-window-position "bottom"
      shell-pop-window-height 50
      shell-pop-universal-key "C-z"
      shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))

(define-key evil-normal-state-map (kbd "C-z") 'shell-pop)
(define-key evil-insert-state-map (kbd "C-z") 'shell-pop)
(global-set-key (kbd "C-z") 'shell-pop)

(require-package 'smex)
(require 'smex)
(smex-initialize)

(evil-add-hjkl-bindings magit-log-mode-map 'emacs)
(evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)

(evil-leader/set-key
  "<SPC>" 'ido-recentf-open
  "x" 'smex
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

(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

(require-package 'elpy)
(elpy-enable)

(require-package 'solarized-theme)
(require-package 'flatui-theme)

(load-theme 'flatui)

(add-to-list 'default-frame-alist
             '(font . "Akkurat Mono-12"))
