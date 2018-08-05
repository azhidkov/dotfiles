;; (menu-bar-mode -1)
;; hide all garbadge
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; set font to 18
(set-face-attribute 'default nil :height 180)
;; (global-display-line-numbers-mode 1)

;; no tabs
(setq-default indent-tabs-mode nil)

;; higlight paranthesis
(setq show-paren-delay 0)
(setq make-backup-files nil)
;; (setq scroll-margin 7)
(show-paren-mode 1)

;; enable IDO Mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
(package-initialize)

;; Installed packages with MELPA
;; company, cmake-mode, flycheck, exec-path-from-shell

;; CMAKE
(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))
(require 'cmake-mode)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; FlyCheck
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
