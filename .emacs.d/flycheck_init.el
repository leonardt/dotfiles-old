;;; init.el --- Summary
;;; Commentary:
;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "49eea2857afb24808915643b1b5bd093eefb35424c758f502e98a03d0d3df4b1" "fb86078eccf56fe7410b9967b84bbb03bd08eea1050f9f06c87410c32ea61b44" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

(defun require-package (package)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

(if (fboundp 'with-eval-after-load)
    (defmacro after (feature &rest body)
      "After FEATURE is loaded, evaluate BODY."
      (declare (indent defun))
      `(with-eval-after-load ,feature ,@body))
  (defmacro after (feature &rest body)
    "After FEATURE is loaded, evaluate BODY."
    (declare (indent defun))
    `(eval-after-load ,feature
       '(progn ,@body))))

(if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

(let ((base "~/.emacs.d/site-lisp"))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

(setenv "TMPDIR" "/tmp")

(require 'opencl-mode)
(add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(unless (display-graphic-p) (menu-bar-mode -1))
(blink-cursor-mode -1)
(setq inhibit-startup-screen t)
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; core editor config

(setq ring-bell-function 'ignore)

;; (add-hook 'prog-mode-hook 'linum-mode)
;; (add-hook 'text-mode-hook 'linum-mode)
;; ;; Linum format to avoid graphics glitches in fringe
;; (setq linum-format " %4d ")

(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 8)            ;; but maintain correct appearance

;; Newline at end of file
(setq require-final-newline t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; (electric-indent-mode t)
(require-package 'aggressive-indent)
(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)

;; path
(when (memq window-system '(mac ns))
  (progn
    (require-package 'exec-path-from-shell)
    (exec-path-from-shell-initialize)))

;; smartparens
(require-package 'smartparens)
(require 'smartparens-config)
(setq sp-autoskip-closing-pair 'always)
(show-smartparens-global-mode t)
(smartparens-global-mode t)

;; smex
(require-package 'smex)
(smex-initialize)

;; evil
(require-package 'evil)
(evil-mode 1)

(require-package 'evil-jumper)
(require 'evil-jumper)

(require-package 'evil-args)
(require 'evil-args)

;; bind evil-args text objects
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

(require-package 'evil-surround)
(global-evil-surround-mode t)

(require-package 'evil-leader)
(global-evil-leader-mode)
(setq evilnc-hotkey-comment-operator "gc")
(require-package 'evil-nerd-commenter)
(require 'evil-nerd-commenter)

(after 'evil
  ;; fix conflict with electric-indent-mode in 24.4
  (define-key evil-insert-state-map [remap newline] 'newline)
  (define-key evil-insert-state-map [remap newline-and-indent] 'newline-and-indent)

  ;; (after "projectile-autoloads"
  ;;   (define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file))
  (evil-leader/set-leader "<SPC>")
  ;; (after "evil-leader-autoloads"
  ;;   (evil-leader/set-key
  ;;     "x" 'smex))
  (after "magit-autoloads"
    (evil-leader/set-key
      "b" 'switch-to-buffer
      "g s" 'magit-status
      "g p s" 'magit-push
      "g p l" 'magit-pull
      "g c" 'magit-commit)))

;; magit
(require-package 'magit)
;; (require-package 'magit-flow)
(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; flx-ido
(require-package 'flx-ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

;; projectile
(require-package 'projectile)
(projectile-global-mode)

;; yasnippet
(require-package 'yasnippet)
(yas-global-mode 1)

;; helm
;; (require-package 'helm)
(require 'helm)
(require 'helm-config)

(helm-mode 1)


(evil-leader/set-key
  "<SPC>" 'helm-mini
  "c" 'compile
  "r" 'recompile
  "f" 'helm-find-files
  "x" 'helm-M-x
  "y" 'helm-show-kill-ring
  "i" 'helm-semantic-or-imenu)

(require 'helm-projectile)
(helm-projectile-on)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

;; markdown
(require-package 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; js2
(require-package 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; clojure
(require-package 'clojure-mode)

(require-package 'cider)

(require-package 'haml-mode)
(require-package 'sass-mode)

;; python
(require-package 'anaconda-mode)
(require-package 'company-anaconda)
(require-package 'nose)

(require 'nose)
(add-hook 'python-mode-hook (lambda () (nose-mode t)))
(evil-leader/set-key
  "t a" 'nosetests-all
  "t m" 'nosetests-module
  "t o" 'nosetests-one
  "t l" 'nosetests-again)

;; racket
(require-package 'racket-mode)



;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
:; (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)

;; company
(require-package 'company)
(require 'company)
(add-to-list 'company-backends 'company-anaconda)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-k") 'yas-expand)

;; c

(require 'flyspell)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-emacs-lisp-load-path load-path)

;; pop shell
(require-package 'shell-pop)

(setq shell-pop-window-position "bottom"
      shell-pop-window-height 50
      shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))

(define-key evil-normal-state-map (kbd "C-t") 'shell-pop)

(require-package 'diminish)
(after 'company (diminish 'company-mode))
(after 'projectile (diminish 'projectile-mode))
(after 'yasnippet (diminish 'yas-minor-mode))
(after 'smartparens (diminish 'smartparens-mode))
(after 'undo-tree (diminish 'undo-tree-mode))

;; theme
(require-package 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'automatic)

(quelpa '(gotham-theme :fetcher github :repo "wasamasa/gotham-theme"))
(load-theme 'solarized-light t)
;; (require-package 'zenburn-theme)
;; (load-theme 'zenburn t)
;; (require-package 'afternoon-theme)
;; (load-theme 'afternoon t)
;; (require-package 'solarized-theme)
;; (load-theme 'solarized-dark t)
(setq initial-frame-alist
      '((font . "Akkurat-Mono-12")))
(setq default-frame-alist
      '((font . "Akkurat-Mono-12")))

(provide 'init)
;;; init.el ends here
