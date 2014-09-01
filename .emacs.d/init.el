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
(add-to-list 'load-path (concat user-emacs-directory "lisp"))

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

(defcustom dotemacs-modules
  '(init-core
    init-evil
    init-helm
    init-smartparens
    init-speedbar
    ; init-themes
    init-clojure
    init-nose
    init-bindings)
  "Set of modules enabled in dotemacs."
  :group 'dotemacs)

(dolist (module dotemacs-modules)
  (require module))

(add-hook 'python-mode-hook 'anaconda-mode)

;; projectile
(projectile-global-mode t)

;; company-mode
(company-auctex-init)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-anaconda)
(setq company-idle-delay 0.2)

;; auctex
(eval-after-load "tex" 
  '(setcdr (assoc "LaTeX" TeX-command-list)
          '("%`%l%(mode) -shell-escape%' %t"
          TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")
    )
  )

;; flycheck
;; (add-hook 'after-init-hook #'global-flycheck-mode)

(add-to-list 'default-frame-alist
             '(font . "Akkurat-Mono-12"))

;; (load-theme 'afternoon t)
;; (load-theme 'solarized-dark)
(setq ns-use-srgb-colorspace t)
;; (load-theme 'sanityinc-tomorrow-night)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
