;; high level aesthetic stuff
;(menu-bar-mode -1)                    ; disable menu
(tool-bar-mode -1)                     ; disable the button bar atop screen
(scroll-bar-mode -1)                   ; disable scroll bar
(setq make-backup-files nil)           ; disable backup files
(setq auto-save-default nil)           ; disable creating #autosave# files
(setq inhibit-startup-screen t);       ; disable startup screen with graphics
(setq-default indent-tabs-mode nil)    ; use spaces instead of tabs
(setq-default tab-width 4)             ; four spaces is a tab
(show-paren-mode 1)                    ; highlight paranthesis
(setq show-paren-delay 0)              ; highlight paranthesis immediately
(setq visible-bell nil)                ; disable annoying visual bell graphics
(setq ring-bell-function 'ignore)      ; disable annoying audio bell
;(global-font-lock-mode 0)              ; turn off syntax highlight

;; check available fonts and set available
(cond
 ((find-font (font-spec :name "Source Code Pro"))
  (set-frame-font "Source Code Pro 20"))       ; 20px on Macos
 ((find-font (font-spec :name "Source Code Variable"))
  (set-frame-font "Source Code Variable 18"))) ; 18px on Linux

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
(add-hook 'after-init-hook 'global-company-mode) ;; use company-mode in all buffers

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
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; flx-mode
;;(unless (package-installed-p 'flx-ido)
;;  (package-install 'flx-ido))
;;(require 'flx-ido)
;;(flx-ido-mode 1)
;; disable ido faces to see flx hightlight
;;(setq ido-use-faces nil)

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

;; helm
;;(unless (package-installed-p 'helm)
;;  (package-install 'helm))
;;(require 'helm-config)
;;(helm-mode 1)
;;(global-set-key (kbd "M-x") #'helm-M-x)
;;(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;;(global-set-key (kbd "C-x C-f") #'helm-find-files)
;;(global-set-key (kbd "C-x C-r") #'helm-recentf)
;;(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
;; end helm

;; helm-projectile
;;(unless (package-installed-p 'helm-projectile)
;;  (package-install 'helm-projectile))

;; ivy-mode
(unless (package-installed-p 'ivy)
  (package-install 'ivy))
(unless (package-installed-p 'swiper)
  (package-install 'swiper))
(unless (package-installed-p 'counsel)
  (package-install 'counsel))
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(setq projectile-completion-system 'ivy)

;; php-mode
(unless (package-installed-p 'php-mode)
  (package-install 'php-mode))

;; web-mode
(unless (package-installed-p 'web-mode)
  (package-install 'web-mode))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; end web-mode

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
