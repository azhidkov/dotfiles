;; high level aesthetic stuff
;(menu-bar-mode -1)                    ; disable menu
(tool-bar-mode -1)                     ; disable the button bar atop screen
(scroll-bar-mode -1)                   ; disable scroll bar
(setq make-backup-files nil)           ; disable backup files
(setq inhibit-startup-screen t);       ; disable startup screen with graphics
(setq-default indent-tabs-mode nil)    ; use spaces instead of tabs
(setq tab-width 2)                     ; four spaces is a tab
(show-paren-mode 1)                    ; highlight paranthesis
(setq show-paren-delay 0)              ; highlight paranthesis immediately
(setq visible-bell nil)                ; disable annoying visual bell graphics
(setq ring-bell-function 'ignore)      ; disable annoying audio bell
(set-frame-font "Source Code Pro 20")  ; set font
;(global-hl-line-mode +1)              ; highlight the current line
;(global-display-line-numbers-mode 1)  ; show line numbers

;; enable ido mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; fix keyboard bindings
;(setq mac-option-modifier 'super)
;(setq mac-command-modifier 'meta)

;; MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; installed packages with MELPA
;; company, cmake-mode, flycheck, exec-path-from-shell

;; cmake-mode
(unless (package-installed-p 'cmake-mode)
  (package-install 'cmake-mode))
(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
(require 'cmake-mode)

;; company
(unless (package-installed-p 'company)
  (package-install 'company))

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (unless (package-installed-p 'exec-path-from-shell)
    (package-install 'exec-path-from-shell))

  (exec-path-from-shell-initialize))

;; projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(require 'projectile)
(projectile-mode t)

;; flycheck
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))
(add-hook 'after-init-hook #'global-flycheck-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company exec-path-from-shell flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
