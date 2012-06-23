# nms-fcgi: A simple Common Lisp (SBCL) wrapper for libfcgi

This library allows you to use the libfcgi API calls from Common Lisp in SBCL, which means you can build FastCGI web applications in Common Lisp.

## Installation

1. Clone the repository: `git clone git://github.com/nizmic/nms-fcgi.git`

2. Optionally copy the code into ~/.local/share/common-lisp/source/ so that it will automatically be found by asdf:  
   `mkdir -p ~/.local/share/common-lisp/source/ && cp -r nms-fcgi ~/.local/share/common-lisp/source/`

## Usage

There are two ways to load this library into your lisp image:

1. Call load on load.lisp:  
   `(load "nms-fcgi/load.lisp")`

--or--

2. Load using asdf:  
   `(require 'asdf)`  
   `(asdf:operate 'asdf:load-op 'nms-fcgi)`
