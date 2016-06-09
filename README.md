# markdownfmt

[![Coverage Status](https://coveralls.io/repos/nlamirault/emacs-markdownfmt/badge.png?branch=master)](https://coveralls.io/r/nlamirault/emacs-markdownfmt?branch=master)

Master :
* [![MELPA Stable](https://stable.melpa.org/packages/markdownfmt-badge.svg)](https://stable.melpa.org/#/markdownfmt)
* [![Circle CI](https://circleci.com/gh/nlamirault/markdownfmt/tree/master.svg?style=svg)](https://circleci.com/gh/nlamirault/emacs-markdownfmt/tree/master)

Develop:
* [![Melpa Status](https://melpa.org/packages/markdownfmt-badge.svg)](https://melpa.org/#/markdownfmt)
* [![Circle CI](https://circleci.com/gh/nlamirault/markdownfmt/tree/develop.svg?style=svg)](https://circleci.com/gh/nlamirault/emacs-markdownfmt/tree/develop)

Format rust code in emacs using [markdownfmt](https://github.com/shurcooL/markdownfmt)

## Installation

The recommended way to install ``markdownfmt`` is via [MELPA][]:

    M-x package-install markdownfmt

or [Cask][]:

	(depends-on "markdownfmt")


## Usage

Run `M-x markdownfmt-format-buffer` to format the current buffer.

For convenience, you may bind it to a key, such as:

```elisp
(define-key markdown-mode-map (kbd "C-c C-f") #'markdownfmt-format-buffer)
```

Alternatively, run *markdownfmt* before saving markdown buffers:

```elisp
(add-hook 'markdown-mode-hook #'markdownfmt-enable-on-save)
```


## Development

### Cask

``markdownfmt`` use [Cask][] for dependencies management. Install it and
retrieve dependencies :

    $ curl -fsSkL https://raw.github.com/cask/cask/master/go | python
    $ export PATH="$HOME/.cask/bin:$PATH"
    $ cask


### Testing

* Launch unit tests from shell

    $ make clean test

* Using [overseer][] :

Keybinding           | Description
---------------------|------------------------------------------------------------
<kbd>C-c , t</kbd>   | launch unit tests from buffer
<kbd>C-c , b</kbd>   | launch unit tests
<kbd>C-c , g</kbd>   | launch unit tests with tag (find, regexp, ...)

* Tips:

If you want to launch a single unit test, add a specify tag :

```lisp
(ert-deftest test-foobar ()
  :tags '(current)
  ```

And launch it using : <kbd>C-c , g</kbd> and specify tag : *current*


## Support / Contribute

See [here](CONTRIBUTING.md)


## Changelog

A changelog is available [here](ChangeLog.md).


## License

See [LICENSE](LICENSE).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>

[emacs-markdownfmt]: https://github.com/nlamirault/markdownfmt
[LICENSE]: https://github.com/nlamirault/emacs-markdownfmt/blob/master/LICENSE

[GNU Emacs]: https://www.gnu.org/software/emacs/
[MELPA]: https://melpa.org/
[Cask]: http://cask.github.io/
[Issue tracker]: https://github.com/nlamirault/emacs-markdownfmt/issues

[overseer]: https://github.com/tonini/overseer.el
