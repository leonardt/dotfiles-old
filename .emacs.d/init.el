(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(electric-indent-mode +1)

;; projectile
(projectile-global-mode t)

; evil mode
(evil-mode 1)
(global-evil-leader-mode)
(global-evil-surround-mode 1)
(evilnc-default-hotkeys)
(global-evil-matchit-mode 1)

;; fix conflict with electric-indent-mode in 24.4
(define-key evil-insert-state-map [remap newline] 'newline)
(define-key evil-insert-state-map [remap newline-and-indent] 'newline-and-indent)

(define-key evil-normal-state-map (kbd "C-p") 'projectile-find-file)

(define-key evil-visual-state-map (kbd "SPC SPC") 'smex)
(define-key evil-normal-state-map (kbd "SPC SPC") 'smex)

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "f" 'find-file
  "g s" 'magit-status
  "g b" 'magit-blame-mode
  "g c" 'magit-commit
  "g l" 'magit-log)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Copy $MANPATH, $PATH, and exec-path from shell in OSX
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; nose.el
(require 'nose)
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key "\C-ca" 'nosetests-all)
            (local-set-key "\C-cm" 'nosetests-module)
            (local-set-key "\C-c." 'nosetests-one)
            (local-set-key "\C-cpa" 'nosetests-pdb-all)
            (local-set-key "\C-cpm" 'nosetests-pdb-module)
            (local-set-key "\C-cp." 'nosetests-pdb-one)))

;; latex
(setq TeX-auto-save t)
(setq TeX-PDF-mode t)

(eval-after-load "tex" 
  '(setcdr (assoc "LaTeX" TeX-command-list)
          '("%`%l%(mode) -shell-escape%' %t"
          TeX-run-TeX nil (latex-mode doctex-mode) :help "Run LaTeX")
    )
  )
 
;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

;; color-theme
(require 'color-theme-sanityinc-tomorrow)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
