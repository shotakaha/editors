;;; init.el --- package.el + use-package setup for Emacs 31 -*- lexical-binding: t; -*-

;; --------------------------------
;; package.el + use-package (built-in)
;; --------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq use-package-always-ensure t)

;; --------------------------------
;; custom-file
;; --------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;; --------------------------------
;; Basic settings
;; --------------------------------
(use-package emacs
  :ensure nil
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
  :ensure nil
  :init (savehist-mode 1))

(use-package recentf
  :ensure nil
  :init (recentf-mode 1))

(use-package saveplace
  :ensure nil
  :init (save-place-mode 1))

;; server (allow connections via emacsclient)
(use-package server
  :ensure nil
  :config
  (unless (server-running-p)
    (server-start)))

;; which-key (built-in)
(use-package which-key
  :ensure nil
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
