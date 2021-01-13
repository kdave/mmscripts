Helper scripts for running the mmtests suite.

Git repositories
----------------

- mmtests:  git://github.com/gormanm/mmtests.git
- xfstests: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git

Usage
=====

* single test run

  $ ./tag-set...
  verify
  pick your config and edit eventually

  $ ./run-single config...
  will grab results

  $ ./clear-results
  clear afterwards

  run next test
