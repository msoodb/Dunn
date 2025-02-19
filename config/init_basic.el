;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Basic UI improvements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(setq inhibit-startup-screen t)

;; Better editing experience
(electric-pair-mode 1)  ;; Auto-close brackets
(show-paren-mode 1)  ;; Highlight matching parentheses
(setq-default indent-tabs-mode nil)  ;; Use spaces instead of tabs
(setq-default tab-width 4)
(global-auto-revert-mode 1)  ;; Auto-reload changed files

;; C/C++ Development Setup
(use-package cc-mode
  :mode ("\\.c\\'" . c-mode)
        ("\\.cpp\\'" . c++-mode)
        ("\\.h\\'" . c-mode))

;; LSP Mode
(use-package lsp-mode
  :ensure t
  :commands lsp lsp-deferred
  :hook ((c-mode . lsp-deferred)
         (c++-mode . lsp-deferred)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(company lsp-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Auto-completion
(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.1))

;; Snippets for C/C++
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

;; Enable Yasnippet for C/C++
(add-hook 'c-mode-hook #'yas-minor-mode)
(add-hook 'c++-mode-hook #'yas-minor-mode)

;; AI Integration (Placeholder, customize as needed)
;; (use-package copilot
;;   :ensure t
;;   :hook (prog-mode . copilot-mode))

;; Load theme
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

;; Keybindings (example)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
