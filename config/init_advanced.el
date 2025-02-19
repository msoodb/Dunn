;; init.el - Emacs as a Multi-Language IDE
;; =======================================
;; Author: msoodb (masoud.bolhassani@gmail.com)
;; Description: Configures Emacs to behave like a full-fledged IDE with support
;; for C/C++, JavaScript, TypeScript, PHP, and Python. Includes LSP, debugging,
;; project management, Git, and terminal integration.

;; ----------------------
;; Package Management
;; ----------------------
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

;; ----------------------
;; UI Enhancements
;; ----------------------
(menu-bar-mode -1)     ;; Disable menu bar
(tool-bar-mode -1)     ;; Disable tool bar
(scroll-bar-mode -1)   ;; Disable scroll bar
(global-display-line-numbers-mode 1) ;; Show line numbers
(setq inhibit-startup-screen t) ;; Disable startup screen

;; Theme and Icons
(use-package doom-themes
  :config (load-theme 'doom-one t))
(use-package all-the-icons
  :if (display-graphic-p))
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;;----------------------
;; Clipboard Integration
;;----------------------
(use-package xclip
  :ensure t
  :config
  (xclip-mode 1))
(setq select-enable-clipboard t)
(setq select-enable-primary t)

;; ----------------------
;; Project Management
;; ----------------------
(use-package projectile
  :config (projectile-mode +1))
(global-set-key (kbd "C-c p f") 'projectile-find-file)
(global-set-key (kbd "C-c p p") 'projectile-switch-project)

;; File Explorer with Treemacs
(use-package treemacs
  :ensure t
  :config (treemacs-projectile))
(use-package treemacs-projectile
  :after (treemacs projectile))
(global-set-key (kbd "C-x t t") 'treemacs)

;; ----------------------
;; LSP and Language Support
;; ----------------------
(use-package lsp-mode
  :commands lsp lsp-deferred
  :hook ((c-mode . lsp-deferred)
         (c++-mode . lsp-deferred))
  :config
  (setq lsp-idle-delay 0.5
        lsp-enable-symbol-highlighting t
        lsp-headerline-breadcrumb-enable t
        lsp-clients-clangd-executable "clangd")  ;; Set Clangd as LSP server
)
(use-package lsp-ui
  :commands lsp-ui-mode)
(use-package lsp-treemacs
  :after lsp)

;; ----------------------
;; Completion and Snippets
;; ----------------------
(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
	company-idle-delay 0.1))

(use-package yasnippet
  :config (yas-global-mode 1))

;;-----------------------
;; Debugging with DAP Mode
;;-----------------------
(use-package dap-mode
  :after lsp-mode
  :config
  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  (dap-auto-configure-mode))

;; ----------------------
;; Version Control (Git)
;; ----------------------
(use-package magit
  :commands magit-status)
(global-set-key (kbd "C-x g") 'magit-status)

;; ----------------------
;; Terminal Integration
;; ----------------------
(use-package vterm)
(global-set-key (kbd "C-x t v") 'vterm)

;; ----------------------
;; Helpful Utilities
;; ----------------------
(use-package which-key
  :config (which-key-mode))
(use-package ivy
  :config (ivy-mode 1))
(desktop-save-mode 1) ;; Save session on exit

;; ----------------------
;; Keybindings
;; ----------------------
(global-set-key (kbd "C-x k") 'kill-this-buffer)

;; End of init.el
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-clangd yasnippet-snippets which-key vterm typescript-mode treemacs-projectile pyvenv python-mode php-mode magit lsp-ui js2-mode ivy doom-themes dap-mode company ccls all-the-icons-dired)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
