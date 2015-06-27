
FROM justincormack/alpine-pkgsrc

MAINTAINER Justin Cormack

ENV \
  CAML_LD_LIBRARY_PATH="/root/.opam/system/lib/stublibs:/usr/pkg/lib/ocaml/stublibs" \
  MANPATH="/root/.opam/system/man:" \
  PERL5LIB="/root/.opam/system/lib/perl5" \
  OCAML_TOPLEVEL_PATH="/root/.opam/system/lib/toplevel" \
  PATH=/root/.opam/system/bin:$PATH

RUN \
  cd /usr/pkgsrc/misc/ocaml-opam && bmake && bmake install && bmake clean-depends && \
  opam init -y && \
  opam update
