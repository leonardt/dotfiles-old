;;; init.el --- Summary
;;; commentary:
;;; code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(background-color "#fdf6e3")
 '(background-mode light)
 '(cursor-color "#657b83")
 '(custom-safe-themes
   (quote
    ("3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "3b819bba57a676edf6e4881bd38c777f96d1aa3b3b5bc21d8266fa5b0d0f1ebf" default)))
 '(foreground-color "#657b83")
 '(magit-use-overlays nil)
 '(shell-pop-autocd-to-working-dir f)
 '(shell-pop-full-span t)
 '(shell-pop-shell-type
   (quote
    ("ansi-term" "*ansi-term*"
     (lambda nil
       (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/usr/local/bin/zsh")
 '(shell-pop-universal-key "C-t")
 '(shell-pop-window-height 30)
 '(shell-pop-window-position "bottom"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
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

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(electric-indent-mode t)
(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent

;; Newline at end of file
(setq require-final-newline t)

; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

(global-hl-line-mode 1)

(require-package 'smartparens)
(require 'smartparens-config)
(setq sp-autoskip-closing-pair 'always)
(smartparens-global-mode t)

(show-paren-mode t)

;; highlight the current line
;; (global-hl-line-mode +1)


;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(require-package 'exec-path-from-shell)

;; Copy $MANPATH, $PATH, and exec-path from shell in OSX
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; No bells
(setq ring-bell-function 'ignore)

;; (setq c-basic-offset 2)
(setq tab-width 2)
(setq indent-tabs-mode nil)

;; move cursor to the last position upon open
(require 'saveplace)
(setq save-place-file (concat temporary-file-directory "places"))
(setq-default save-place t)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


(require-package 'evil)
(evil-mode 1)

(require-package 'evil-org)
;; (require 'evil-org)
;; (setq evil-org-set-leader nil)

(require-package 'evil-surround)
(require-package 'evil-nerd-commenter)
(define-key evil-normal-state-map (kbd "gc") 'evilnc-comment-or-uncomment-lines)
;; (define-key evil-normal-state-map (kbd "gcp") 'evilnc-comment-or-uncomment-paragraphs)
(require-package 'evil-jumper)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)



(require-package 'evil-nerd-commenter)
;; (setq evilnc-hotkey-comment-operator "gc")

;; fix conflict with electric-indent-mode in 24.4
(define-key evil-insert-state-map [remap newline] 'newline)
(define-key evil-insert-state-map [remap newline-and-indent] 'newline-and-indent)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

(require-package 'evil-args)
;; bind evil-args text objects
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)


(require-package 'evil-leader)
(global-evil-leader-mode t)

(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "g s" 'magit-status
  "g p s" 'magit-push
  "g p l" 'magit-pull
  "g b" 'magit-blame-mode
  "g c" 'magit-commit
  "g l" 'magit-log
  "i" 'helm-semantic-or-imenu
  "f" 'helm-find-files
  "b" 'helm-mini
  "<SPC>" 'helm-mini
  "x" 'helm-M-x)

(setq evil-emacs-state-cursor  '("red" box))
(setq evil-normal-state-cursor '("gray" box))
(setq evil-visual-state-cursor '("gray" box))
(setq evil-insert-state-cursor '("gray" bar))
(setq evil-motion-state-cursor '("gray" box))

;; (From prelude)
;; Magit from avsej
;;
(evil-add-hjkl-bindings magit-log-mode-map 'emacs)
(evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)


;; prevent esc-key from translating to meta-key in terminal mode
(setq evil-esc-delay 0)

(require-package 'helm)
(helm-mode 1)

(require-package 'projectile)
(require-package 'helm-projectile)
(require 'projectile)
(projectile-global-mode t)


(require-package 'company)
(require 'company)
(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(add-hook 'after-init-hook 'global-company-mode)

(defadvice company-complete-common
    (around advice-for-company-complete-common activate)
  (when (null (yas-expand))
    ad-do-it))

(require-package 'yasnippet)
(require 'yasnippet)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(yas-reload-all)

(require-package 'flycheck)
(global-flycheck-mode t)
(after 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; python
(require-package 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'eldoc-mode)

(require-package 'company-anaconda)
(add-to-list 'company-backends 'company-anaconda)

(require-package 'nose)
(require 'nose)
(add-hook 'python-mode-hook
          (lambda ()
            (evil-leader/set-key
              "t a" 'nosetests-all
              "t m" 'nosetests-module
              "t l" 'nosetests-again
              "t o" 'nosetests-one)))

(require-package 'shell-pop)
(define-key evil-normal-state-map (kbd "C-t") 'shell-pop)
(define-key evil-insert-state-map (kbd "C-t") 'shell-pop)


;; (global-linum-mode t)

;; (require-package 'workgroups2)
;; (workgroups-mode 1)
;; 
;; (evil-leader/set-key
;;   "w c" 'wg-create-workgroup
;;   "w r" 'wg-rename-workgroup
;;   "w s" 'wg-switch-to-workgroup
;;   "w k" 'wg-kill-workgroup)

;; (require-package 'persp-mode)
;; (add-hook 'after-init-hook 'persp-mode)
;; (evil-leader/set-key
;;               "p s" 'persp-switch
;;               "p k" 'persp-remove-buffer
;;               "p r" 'persp-rename
;;               "p a" 'persp-add-buffer
;;               "p A" 'persp-set-buffer
;;               "p i" 'persp-import)

(require-package 'key-chord)
(define-key evil-normal-state-map (kbd "gt") 'persp-next)
(define-key evil-normal-state-map (kbd "gT") 'persp-prev)

(require-package 'clojure-mode)
(require-package 'cider)

(require-package 'haml-mode)
(require-package 'sass-mode)
;; cargo-culted from http://stackoverflow.com/questions/11972553/how-to-fix-a-strange-indentation-behaviour-in-emacs-sass-mode
(defconst sass-line-keywords
  '(("@\\(\\w+\\)"    0 font-lock-keyword-face sass-highlight-directive)
("/[/*].*"  0 font-lock-comment-face)
("[=+]\\w+" 0 font-lock-variable-name-face sass-highlight-script-after-match)
("!\\w+"    0 font-lock-variable-name-face sass-highlight-script-after-match)
(":\\w+"    0 font-lock-variable-name-face)
("\\w+\s*:" 0 font-lock-variable-name-face)
("\\(\\w+\\)\s*="  1 font-lock-variable-name-face sass-highlight-script-after-match)
("\\(:\\w+\\)\s*=" 1 font-lock-variable-name-face sass-highlight-script-after-match)
(".*"      sass-highlight-selector)))

(defconst sass-selector-font-lock-keywords
  '( ;; Attribute selectors (e.g. p[foo=bar])
("\\[\\([^]=]+\\)" (1 font-lock-variable-name-face)
 ("[~|$^*]?=\\([^]=]+\\)" nil nil (1 font-lock-string-face)))
("&"       0 font-lock-constant-face)
("\\.\\w+" 0 font-lock-type-face)
("#\\w+"   0 font-lock-keyword-face)
;; Pseudo-selectors, optionally with arguments (e.g. :first, :nth-child(12))
("\\(::?\\w+\\)" (1 font-lock-variable-name-face)
 ("(\\([^)]+\\))" nil nil (1 font-lock-string-face)))))
(defconst sass-non-block-openers
  '("^.*,$" ;; Continued selectors
"^ *@\\(extend\\|debug\\|warn\\|include\\|import\\)" ;; Single-line mixins
"^ *[$!]"     ;; Variables
".*[^\s-]+: [^\s-]" ;; a setting of some sort
))

(add-to-list 'default-frame-alist
             '(font . "Akkurat-Mono-12"))
             ;;'(font . "DejaVu Sans Mono-12"))
;; (setq default-frame-alist '(
;;    (font . "Akkurat-Mono-12")
;;  ))

(require-package 'diminish)

(after 'projectile (diminish 'projectile-mode))
(after 'yasnippet (diminish 'yas-minor-mode))
(after 'smartparens (diminish 'smartparens-mode))
(after 'company (diminish 'company-mode))
(after 'magit (diminish 'magit-auto-revert-mode))

;; Use Emacs terminfo, not system terminfo
(setq system-uses-terminfo nil)

;; Configure a reasonable fill column, indicate it in the buffer and enable
;; automatic filling
(require-package 'fill-column-indicator)
(require 'fill-column-indicator)
(setq-default fill-column 80)
(dolist (hook '(prog-mode-hook text-mode-hook))
  (add-hook hook 'fci-mode))
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; company<->fci-mode bug workaround
;; https://github.com/company-mode/company-mode/issues/180
(defvar-local company-fci-mode-on-p nil)

(defun company-turn-off-fci (&rest ignore)
  (when (boundp 'fci-mode)
    (setq company-fci-mode-on-p fci-mode)
    (when fci-mode (fci-mode -1))))

(defun company-maybe-turn-on-fci (&rest ignore)
  (when company-fci-mode-on-p (fci-mode 1)))

(add-hook 'company-completion-started-hook 'company-turn-off-fci)
(add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
(add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci)

(setq ns-use-srgb-colorspace t)
(require-package 'smart-mode-line)
(sml/setup 'no-confirm)
(sml/apply-theme 'respectful)

;; (load-theme 'afternoon t)
(require-package 'solarized-theme)
;;(load-theme 'solarized-light 'no-confirm)
(load-theme 'zenburn t)

