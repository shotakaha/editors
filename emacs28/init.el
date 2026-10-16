;;; init.el --- straight.el + use-package setup for Emacs 28 or later -*- lexical-binding: t; -*-

;; --------------------------------
;; straight.el + use-package
;; --------------------------------
;; straight.el is bootstrapped in early-init.el
;; use-package is built-in since Emacs 29, install it with straight.el
;; Built-in packages need ":straight nil"
(straight-use-package 'use-package)

;; --------------------------------
;; custom-file
;; --------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;; --------------------------------
;; Basic settings
;; --------------------------------
(use-package emacs
  :straight nil
  :custom
  (inhibit-startup-screen t)
  (make-backup-files nil)
  (auto-save-default nil)
  (create-lockfiles nil)
  (tab-always-indent 'complete)
  :init
  (prefer-coding-system 'utf-8)
  (show-paren-mode 1)
  :bind
  (("C-h" . delete-backward-char)))

;; Save history
(use-package savehist
  :straight nil
  :init (savehist-mode 1))

(use-package recentf
  :straight nil
  :init (recentf-mode 1))

(use-package saveplace
  :straight nil
  :init (save-place-mode 1))

;; server (allow connections via emacsclient)
(use-package server
  :straight nil
  :config
  (unless (server-running-p)
    (server-start)))

;; which-key (built-in since Emacs 30)
(use-package which-key
  :init (which-key-mode 1))

;; vertico
(use-package vertico
  :init (vertico-mode)
  :custom (vertico-cycle t))

;; orderless
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

;; consult
(use-package consult
  :bind (("C-s"   . consult-line)
         ("C-x b" . consult-buffer)
         ("M-y"   . consult-yank-pop)
         ("M-g g" . consult-goto-line)))

;; marginalia
(use-package marginalia
  :init (marginalia-mode))

;; corfu
(use-package corfu
  :init (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-cycle t))

;; cape
(use-package cape
  :init
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;; rainbow-delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; nerd-icons (run M-x nerd-icons-install-fonts on first use only)
(use-package nerd-icons)

;; doom-modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-icon t)
  (doom-modeline-minor-modes nil))

;;; init.el ends here
