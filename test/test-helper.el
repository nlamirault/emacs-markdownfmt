;; test-helper.el --- Test helpers for markdownfmt.el

;; Copyright (C) 2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;     http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;;; Commentary:

;;; Code:

(require 'ansi)
(require 'cl) ;; http://emacs.stackexchange.com/questions/2864/symbols-function-definition-is-void-cl-macroexpand-all-when-trying-to-instal
(require 'ert)
(require 'f)
(require 'undercover)

(setq debugger-batch-max-lines (+ 50 max-lisp-eval-depth)
      debug-on-error t)

(defvar username (getenv "HOME"))

(defconst go-test-testsuite-dir
  (f-parent (f-this-file))
  "The testsuite directory.")

(defconst go-test-source-dir
  (f-parent go-test-testsuite-dir)
  "The markdownfmt source directory.")

(defconst go-test-sandbox-path
  (f-expand "sandbox" go-test-testsuite-dir)
  "The sandbox path for markdownfmt.")

(defun cleanup-load-path ()
  "Remove home directory from 'load-path."
  (message (ansi-green "[markdownfmt] Cleanup path"))
  (mapc #'(lambda (path)
            (when (string-match (s-concat username "/.emacs.d") path)
              (message (ansi-yellow "Delete path %s" path))
              (setq load-path (delete path load-path))))
        load-path))

(defun load-unit-tests (path)
  "Load all unit test from PATH."
  (message (ansi-green "[markdownfmt] Execute unit tests %s" path))
  (dolist (test-file (or argv (directory-files path t "-test.el$")))
    (load test-file nil t)))


(defun load-library (file)
  "Load current library from FILE."
  (let ((path (s-concat go-test-source-dir file)))
    (message (ansi-yellow "[markdownfmt] Load library from %s" path))
    (undercover "*.el" (:exclude "*-test.el"))
    (require 'markdownfmt path)))


(defmacro with-test-sandbox (&rest body)
  "Evaluate BODY in an empty sandbox directory."
  `(unwind-protect
       (condition-case nil ;ex
           (let ((default-directory go-test-source-dir))
             ;; (unless (f-dir? go-test-sandbox-path)
             ;;   (f-mkdir go-test-sandbox-path))
             (cleanup-load-path)
             (load-library "/markdownfmt.el")
             ,@body)
         ;; (f-delete go-test-sandbox-path :force)))
         )))
         ;; (error
         ;;  (message (ansi-red "[markdownfmt] Error during unit tests : %s" ex))))))

(provide 'test-helper)
;;; test-helper.el ends here
