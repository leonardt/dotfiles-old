;;; init-el --- Emacs config
;;; Commentary:
;;; Code:

(defgroup dotemacs nil
  "Custom configuration for dotemacs."
  :group 'local)

(defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
  "The storage location for various persistent files."
  :group 'dotemacs)

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(unless (display-graphic-p) (menu-bar-mode -1))

(add-to-list 'load-path (concat user-emacs-directory "config"))
;; (add-to-list 'load-path (concat user-emacs-directory "lisp"))

(require 'init-packages)
(require 'cl)

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

;; projectile
(projectile-global-mode t)

(defcustom dotemacs-modules
  '(init-core
    init-evil
    init-helm
    init-smartparens
    init-speedbar
    init-yasnippet
    ; init-themes
    init-clojure
    init-nose
    init-bindings)
  "Set of modules enabled in dotemacs."
  :group 'dotemacs)

(dolist (module dotemacs-modules)
  (require module))

(add-hook 'python-mode-hook 'anaconda-mode)

;; company-mode
(company-auctex-init)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-anaconda)
(setq company-idle-delay 0.2)

;; auctex
(setq TeX-auto-save t)
(setq TeX-PDF-mode t)
(eval-after-load "tex" 
  '(setcdr (assoc "LaTeX" TeX-command-list)
          '("%`%l%(mode) -shell-escape%' %t"
          TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")
    )
  )

;; flycheck
(require-package 'flycheck)

(setq-default flycheck-emacs-lisp-load-path load-path)
(add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'default-frame-alist
             '(font . "Akkurat-Mono-12"))

(setq ns-use-srgb-colorspace t)
;; (load-theme 'afternoon t)
(load-theme 'solarized-dark t)
;; (load-theme 'brin t)
;; (load-theme 'sanityinc-tomorrow-night)
(custom-set-variables
 '(coffee-tab-width 2))

;;; init.el ends here
