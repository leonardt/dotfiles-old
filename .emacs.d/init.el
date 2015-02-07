(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "%(PDF)amstex %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "texexec --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "texexec %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "open -a Skim.app %s.pdf" TeX-run-command t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file")
     ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "b458d10c9ea0c8c465635b7b13e1bd23f04e6b696b1ca96cb2c4eca35a31641e" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "30a8a5a9099e000f5d4dbfb2d6706e0a94d56620320ce1071eede5481f77d312" default)))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#ff7f00")
     (60 . "#ffbf00")
     (80 . "#b58900")
     (100 . "#ffff00")
     (120 . "#ffff00")
     (140 . "#ffff00")
     (160 . "#ffff00")
     (180 . "#859900")
     (200 . "#aaff55")
     (220 . "#7fff7f")
     (240 . "#55ffaa")
     (260 . "#2affd4")
     (280 . "#2aa198")
     (300 . "#00ffff")
     (320 . "#00ffff")
     (340 . "#00ffff")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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

(server-start)
(setenv "EDITOR" "emacsclient")

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


(require-package 'flx)
(require-package 'flx-ido)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)

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

(require-package 'geiser)
(require-package 'aggressive-indent)
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'geiser-mode-hook #'aggressive-indent-mode)

(require-package 'ycmd)
(set-variable 'ycmd-server-command '("python" "/Users/leonardtruong/dev/projects/ycmd/ycmd"))
(ycmd-setup)
;; (add-hook 'c++-mode-hook 'ycmd-mode)
(require-package 'company-ycmd)
(company-ycmd-setup)

(require-package 'nose)
(require 'nose)
(setq nose-global-name "nosetests-2.7")
(add-hook 'python-mode-hook (lambda () (nose-mode t)))
(evil-leader/set-key
  "t a" 'nosetests-all
  "t m" 'nosetests-module
  "t o" 'nosetests-one
  "t l" 'nosetests-again)

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


(require-package 'shell-pop)

(setq shell-pop-window-position "bottom"
      shell-pop-window-height 50
      shell-pop-universal-key "C-z"
      shell-pop-shell-type '("eshell" "*eshell*" (lambda () (eshell))))

(define-key evil-normal-state-map (kbd "C-z") 'shell-pop)
(define-key evil-insert-state-map (kbd "C-z") 'shell-pop)
(global-set-key (kbd "C-z") 'shell-pop)

(require-package 'projectile)
(projectile-global-mode)

(require-package 'perspective)
(persp-mode)
(require-package 'persp-projectile)
(require 'persp-projectile)

(evil-leader/set-key
  "<SPC>" 'helm-mini
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
  "s p" 'projectile-persp-switch-project
  "p s" 'persp-switch)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

(require-package 'auctex)
(setq TeX-parse-self t); Enable parse on load.
(setq TeX-auto-save t); Enable parse on save.
(setq-default TeX-master nil)
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t)
  )

(add-hook 'TeX-mode-hook 'flyspell-mode); Enable Flyspell mode for TeX modes such as AUCTeX. Highlights all misspelled words.
(setq ispell-dictionary "english"); Default dictionary. To change do M-x ispell-change-dictionary RET.

;; LaTeX-math-mode http://www.gnu.org/s/auctex/manual/auctex/Mathematics.html
(add-hook 'TeX-mode-hook 'LaTeX-math-mode)

(require-package 'company-auctex)
(company-auctex-init)


(require-package 'gotham-theme)
(require-package 'zenburn-theme)
(require-package 'solarized-theme)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'flatui-theme)

;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'solarized-dark t)
(require-package 'smart-mode-line)
(sml/setup)
(sml/apply-theme 'automatic)

;; (require-package 'theme-changer)
;; (setq calendar-location-name "Berkeley, CA") 
;; (setq calendar-latitude 37.89)
;; (setq calendar-longitude -122.28)
;; (load-theme 'solarized-light t)
;; (require 'theme-changer)
;; (change-theme 'solarized-light 'solarized-dark)

(add-to-list 'default-frame-alist
             '(font . "Akkurat Mono-12"))
