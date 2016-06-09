;;; markdownfmt-version-test.el --- Tests for version information

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


(require 'test-helper)

(ert-deftest test-markdownfmt-library-version ()
  :expected-result (if (executable-find "cask") :passed :failed)
  (let* ((cask-version (car (last (process-lines "cask" "version")))))
    (message "markdownfmt Cask version: %s" cask-version)
    (should (string= "0.1.0" cask-version))))


(provide 'markdownfmt-version-test)
;;; markdownfmt-version-test.el ends here
