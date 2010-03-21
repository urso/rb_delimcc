
Introduction
------------

rb_delimcc adds support for delimited continuations build upon callcc.

Installation
------------

rb_delimcc comes with a gem specification, but is not available from
rubygems.org yet. So to install you have to:

1. get the source 
    - from github: 

        $ git clone git://github.com/urso/rb_delimcc.git

    - or download zip file from http://github.com/urso/rb_delimcc/zipball/master
    - or download tarball from http://github.com/urso/rb_delimcc/tarball/master
      
2. install the gem (in source directory):

    $ gem build rb_delimcc.gemspec
    $ sudo gem install rb_delimcc

Usage:
------

To use rb_prob you need to use rubygems and require the library:

    require 'rubygems'

    require 'delimcc'
    include DelimCC # optional, but will save some typing

The only functions you will need are 'reset' and 'shift'.

Examples
--------

some simple examples can be found in examples/testcc.rb . 
Just run the file with 'ruby testcc.rb', to find out how delimcc works.

Limitations
-----------

delimcc is build upon callcc, so if your ruby implementation of choice has no
proper call/cc support build in, delimited continuations won't work then.

