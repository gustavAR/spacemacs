;;; init.el --- Spacemacs Initialization File
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(defconst spacemacs-version          "0.100.1" "Spacemacs version.")
(defconst spacemacs-emacs-min-version   "24.3" "Minimal version of Emacs.")

(defun spacemacs/emacs-version-ok ()
  (version<= spacemacs-emacs-min-version emacs-version))

(when (spacemacs/emacs-version-ok)
  (load-file (concat user-emacs-directory "core/core-load-paths.el"))
  (require 'core-spacemacs)
  (require 'core-configuration-layer)
  (spacemacs/init)
  (configuration-layer/sync)
  (spacemacs/setup-after-init-hook)
  (require 'server)
  ;; Ignore warning about safety of directories :(
  ;; Couldn't solve this by changing the owner of the directory
  ;; (defun server-ensure-safe-dir (dir) "Noop" t)
  (unless (server-running-p)
  (when (eq window-system 'w32) 
    (defun server-ensure-safe-dir (dir) "Noop" t) ; Suppress error "directory
                                                  ; ~/.emacs.d/server is unsafe"
                                                  ; on windows.
    (server-start))))
