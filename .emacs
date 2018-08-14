;; high level aesthetic stuff
;(menu-bar-mode -1)                    ; disable menu
(tool-bar-mode -1)                     ; disable the button bar atop screen
(scroll-bar-mode -1)                   ; disable scroll bar
(setq make-backup-files nil)           ; disable backup files
(setq inhibit-startup-screen t);       ; disable startup screen with graphics
(setq-default indent-tabs-mode nil)    ; use spaces instead of tabs
(setq-default tab-width 4)             ; four spaces is a tab
(show-paren-mode 1)                    ; highlight paranthesis
(setq show-paren-delay 0)              ; highlight paranthesis immediately
(setq visible-bell nil)                ; disable annoying visual bell graphics
(setq ring-bell-function 'ignore)      ; disable annoying audio bell

;; check available fonts and set available
(cond
 ((find-font (font-spec :name "Source Code Pro"))
  (set-frame-font "Source Code Pro 20"))
 ((find-font (font-spec :name "Source Code Variable"))
  (set-frame-font "Source Code Variable 20")))

;(global-hl-line-mode +1)              ; highlight the current line
;(global-display-line-numbers-mode 1)  ; show line numbers

;; enable ido mode
(ido-mode 1)
(ido-everywhere t)
(setq ido-enable-flex-matching t)

;; enable recentf-mode
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(add-to-list 'recentf-exclude "recentf")
(run-at-time nil (* 5 60) 'recentf-save-list) ;; save every 5 minutes
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

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
(require 'company)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (unless (package-installed-p 'exec-path-from-shell)
    (package-install 'exec-path-from-shell))

  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;; projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(require 'projectile)
(projectile-mode t)

;; flx-mode
(unless (package-installed-p 'flx-ido)
  (package-install 'flx-ido))
(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx hightlight
(setq ido-use-faces nil)

;; golang
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))

(unless (package-installed-p 'company-go)
  (package-install 'company-go))

(unless (package-installed-p 'go-guru)
  (package-install 'go-guru))

(unless (package-installed-p 'flycheck-gometalinter)
  (package-install 'flycheck-gometalinter))
(require 'flycheck-gometalinter)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

(defun my-go-mode-hook()
  (require 'go-guru)
  (require 'company)
  (require 'company-go)

  ;; add company-go as backend to company
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)

  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  ;; guru settings
  (go-guru-hl-identifier-mode) ; highlight identifiers

  ;; key bindings specific to go-mode
  (local-set-key (kbd "M-.") 'godef-jump)      ; go to definition
  (local-set-key (kbd "M-*") 'pop-tag-mark)    ; return from whence you came
  (local-set-key (kbd "M-p") 'compile)         ; invoke compiler
  (local-set-key (kbd "M-P") 'recompile)       ; redo most recent compile cmd
  (local-set-key (kbd "M-]") 'next-error)      ; go to next error or msg
  (local-set-key (kbd "M-[") 'previous-error)) ; go to previous error or msg

;; connect go-mode-hook with the function we just defined
(add-hook 'go-mode-hook 'my-go-mode-hook)
;; end golang

;; solarized-theme
(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))
(require 'solarized)

;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; Use less bolding
(setq solarized-use-less-bold t)

;; Don't change size of org-mode headlines (but keep other size-changes)
(setq solarized-scale-org-headlines nil)

;; Avoid all font-size changes
(setq solarized-height-minus-1 1.0)
(setq solarized-height-plus-1 1.0)
(setq solarized-height-plus-2 1.0)
(setq solarized-height-plus-3 1.0)
(setq solarized-height-plus-4 1.0)

(load-theme 'solarized-light t)
;; end solarized-theme

;; flycheck
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))
(add-hook 'after-init-hook #'global-flycheck-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages (quote (company exec-path-from-shell flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
