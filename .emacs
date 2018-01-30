(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
;;  '(custom-enabled-themes (quote (tsdh-dark)))
;;  '(custom-safe-themes (quote ("27470eddcaeb3507eca2760710cc7c43f1b53854372592a3afa008268bcf7a75" default)))
 '(display-time-mode nil)
 '(inhibit-startup-screen t)
 '(ps-paper-type (quote a4))
 '(ps-print-color-p nil)
 '(show-paren-mode t nil (paren)))

(setq-default c-default-style "stroustrup"
			  c-basic-offset 2
			  tab-width 2
			  indent-tabs-mode nil)

(add-to-list 'load-path "/Users/ajaykumarkannan/.emacs.d/")
;; (load "smart-tabs-mode.el")
;; (smart-tabs-insinuate 'c 'c++ 'javascript 'java)

;; Enable line number
(global-linum-mode 1)

;; Python hook 
(add-hook 'python-mode-hook
		  (lambda ()
			(setq indent-tabs-mode nil)
			(setq tab-width 4)
			(setq python-indent 4)))

(setq ispell-program-name "aspell")
(setq ispell-dictionary "english")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Bitstream Vera Sans Mono" :foundry "bitstream" :slant normal :weight normal :height 90 :width normal)))))

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
 backup-by-copying t    ; Don't delink hardlinks
 version-control t      ; Use version numbers on backups
 delete-old-versions t  ; Automatically delete excess backups
 kept-new-versions 20   ; how many of the newest versions to keep
 kept-old-versions 5    ; and how many of the old
)
(setq whitespace-style '(trailing tabs newline tab-mark newline-mark))
