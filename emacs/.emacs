(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "~/emacs_plugins/ProofGeneral/generic/proof-site.el")
(setq coq-prog-name "/usr/bin/coqtop")

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)

;;; Package management
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if not"
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
	 nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
	   (package-install package)
	 package)))
   packages))

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

(ensure-package-installed 'auto-complete
			  'fill-column-indicator
			  'slime)

;; Enable modes
(require 'ido)
(ido-mode t)

(require 'auto-complete)
(global-auto-complete-mode t)
(defun auto-complete-mode-maybe ()
  "Disables auto-complete in the mini buffer"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

(require 'fill-column-indicator)
(define-globalized-minor-mode
  global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)



;; enable line numbers
(global-linum-mode t)
(line-number-mode t)
(column-number-mode t)

;; Slime setup
(setq inferior-lisp-program "/usr/bin/sbcl")

;; Python stuff
(setq py-install-directory "~/.emacs.d/python-mode.el-6.2.0")
(add-to-list 'load-path py-install-directory)
(require 'python-mode)

(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")

; switch buffers after executing code
(setq py-shell-switch-buffers-on-execute-p t)
(setq py-switch-buffers-on-execute-p t)

(setq py-split-windows-on-execute-p nil)
(setq py-smart-indentation t)
