;; init-ruby.el --- Initialize ruby configurations.
;;
;; Author: Vincent Zhang <seagle0128@gmail.com>
;; Version: 1.0.0
;; URL: https://github.com/seagle0128/.emacs.d
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;             Ruby configurations.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; Ruby mode
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))

(use-package robe
  :config
  (add-hook 'ruby-mode-hook
            '(lambda ()
               (robe-mode 1)
               (inf-ruby-minor-mode 1)
               (local-set-key [f1] 'yari)))

  (add-hook 'after-init-hook 'inf-ruby-switch-setup)

  ;; Auto complete
  (eval-after-load 'auto-complete
    '(add-hook 'robe-mode-hook 'ac-robe-setup))
  (eval-after-load 'auto-complete
    '(add-to-list 'ac-modes 'inf-ruby-minor-mode))
  (eval-after-load 'auto-complete
    '(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable))
  (eval-after-load 'auto-complete
    '(define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))

  ;; Company
  (eval-after-load 'company
    '(push 'company-robe company-backends)))

;; YAML mode
(use-package yaml-mode
  :config
  (add-hook 'yaml-mode-hook
            '(lambda ()
               (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

;; Yard mode
(use-package yard-mode
  :config
  (add-hook 'ruby-mode-hook 'yard-mode))

(provide 'init-ruby)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ruby.el ends here
