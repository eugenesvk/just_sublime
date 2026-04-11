# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

[no-cd]
# <- meta.annotation.just variable.annotation.just
#^^^^^^ meta.annotation.just variable.annotation.just
[no-exit-message]
#^^^^^^^^^^^^^^^^ meta.annotation.just variable.annotation.just
[private]
#^^^^^^^^ meta.annotation.just variable.annotation.just
attr-test:

[linux]
#^^^^^^ meta.annotation.just variable.annotation.just
linux-attr:

[  macos  ]
#^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
macos-attr:

[unix   ]
#^^^^^^^^ meta.sequence.list.just meta.annotation.just
unix-attr:

[  windows]
#^^^^^^^^^ meta.sequence.list.just meta.annotation.just
windows-attr:

[ windows, macos, linux]
#^^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
# ^^^^^^^ variable.annotation.just
#        ^ punctuation.separator.parameters.just
#          ^^^^^ variable.annotation.just
#               ^ punctuation.separator.parameters.just
#                 ^^^^^ variable.annotation.just
attr-multi-valid:

[windows linux]
#^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#^^^^^^^ variable.annotation.just
#        ^^^^^ - variable.annotation.just
attr-multi-invalid-1:

[macos, ]
#       ^ invalid.illegal.just
attr-multi-invalid-2:

[nonexistant-attribute]
#<- meta.sequence.list.just meta.annotation.just meta.annotation.just variable.annotation.just
#^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just - variable.annotation.just
attr-invalid:

[confirm, group('DOC')]
#<- meta.sequence.list.just meta.annotation.just meta.annotation.just variable.annotation.just
#^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#              ^ punctuation.definition.annotation.begin.just
#               ^^^^^ string.quoted
#                    ^ punctuation.definition.annotation.end.just
confirm-group:

[confirm("You sure?"), no-cd]
confirm-with-arg:

[script("bash", '-eu')]
#^^^^^^ meta.sequence.list.just meta.annotation.just variable.annotation.just
#      ^ meta.sequence.list.just meta.annotation.just punctuation.definition.annotation.begin.just
#      ^^^^^^^^^^^^^^^ meta.sequence.list.just
#       ^^^^^^ string.quoted.double.just
#               ^^^^^ string.quoted.single.just
recipe:
  @echo "do it"

[working-directory: '']
#                 ^ meta.sequence.list.just meta.annotation.just keyword.operator.assignment.just
#                   ^ string.quoted.single.just punctuation.definition.string.begin.just
#                    ^ string.quoted.single.just punctuation.definition.string.end.just
working-dir:

[working-directory: `/tmp`]
#                   ^ invalid.illegal.just
tmp-dir-invalid:
  @echo "nope"

[working-directory: '/tmp', script("bash")]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#                 ^ keyword.operator.assignment.just
#                   ^ string.quoted.single.just punctuation.definition.string.begin.just
#                    ^^^^^ string.quoted.single.just
#                         ^ punctuation.separator.parameters.just
#                           ^^^^^^ variable.annotation.just
#                                 ^ punctuation.definition.annotation.begin.just
#                                  ^^^^^^ string.quoted.double.just
#                                  ^ punctuation.definition.string.begin.just
#                                        ^ punctuation.definition.annotation.end.just
#                                         ^ variable.annotation.just
doit:
  @echo "done"

[default]
#<- meta.sequence.list.just meta.annotation.just
#^^^^^^^^ meta.sequence.list.just meta.annotation.just
def:

[arg("name")]
#^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#   ^ punctuation.definition.annotation.begin.just
#    ^ string.quoted.double.just punctuation.definition.string.begin.just
#     ^^^^ string.quoted.double.just
#         ^ string.quoted.double.just punctuation.definition.string.end.just
#          ^ punctuation.definition.annotation.end.just
#           ^ variable.annotation.just
arg-positional-only:

[arg("name", help="Show this help")]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#          ^ punctuation.separator.parameters.just
#            ^^^^ variable.parameter.just
#                ^ keyword.operator.assignment.just
#                 ^^^^^^^^^^^^^^^^ string.quoted.double.just
arg-with-help:

[arg("name", short="n", long="name")]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#            ^^^^^ variable.parameter.just
#                 ^ keyword.operator.assignment.just
#                  ^^^ string.quoted.double.just
#                       ^^^^ variable.parameter.just
#                            ^^^^^^ string.quoted.double.just
arg-with-short-and-long:

[arg("name", help="Desc", short="n", long="name", pattern=".*", value="VAL")]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#                                                               ^^^^^ variable.parameter.just
#                                                                    ^ keyword.operator.assignment.just
#                                                                     ^ string.quoted.double.just punctuation.definition.string.begin.just
#                                                                      ^^^ string.quoted.double.just
#                                                                         ^ string.quoted.double.just punctuation.definition.string.end.just
#                                                                          ^ punctuation.definition.annotation.end.just
#                                                                           ^ variable.annotation.just
arg-all-kwargs:

[arg("name", help='''
#                 ^^^ string.quoted.single.block.just punctuation.definition.string.begin.just
multiline
#^^^^^^^^ string.quoted.single.block.just
''')]
#<- string.quoted.single.block.just punctuation.definition.string.end.just
#^^ string.quoted.single.block.just punctuation.definition.string.end.just
#  ^ punctuation.definition.annotation.end.just
#   ^ variable.annotation.just
arg-multiline-help:

[arg("name", unknown="x")]
#            ^^^^^^^ invalid.illegal.just
arg-invalid-kwarg:

[no-cd, arg("verbose", short="v"), linux]
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.list.just meta.annotation.just
#       ^^^ variable.annotation.just
#          ^ punctuation.definition.annotation.begin.just
#           ^ string.quoted.double.just punctuation.definition.string.begin.just
#            ^^^^^^^^ string.quoted.double.just
#                    ^ punctuation.separator.parameters.just
#                      ^^^^^ variable.parameter.just
#                           ^ keyword.operator.assignment.just
#                            ^ string.quoted.double.just punctuation.definition.string.begin.just
#                             ^ string.quoted.double.just
#                              ^ string.quoted.double.just punctuation.definition.string.end.just
#                               ^ punctuation.definition.annotation.end.just
#                                ^ punctuation.separator.parameters.just
#                                  ^^^^^ variable.annotation.just
arg-mixed-with-other-attrs:

[arg("name", long=f"nope")]
#                 ^^ invalid.illegal.just
#                   ^^^^^ - string.quoted.double.just
arg-f-strings-invalid-arg:
