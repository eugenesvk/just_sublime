# SYNTAX TEST "Packages/Just/Syntax/Just.sublime-syntax"

string-with-no-newline := "\
#                      ^^ keyword.operator.assignment.just
#                         ^^ string.quoted.double.just
"


# Single-quoted strings don't recognize escape sequences
single_backslash := '\'
#                    ^ string.quoted.single.just - constant.character.escape.just

single_escapes := '\t\n\r\"\\\'
#                  ^^^^^^^^^^^ string.quoted.single.just - constant.character.escape.just


# Double-quoted strings DO recognize escape sequences
double_escapes := "\t\n\r\"\\"
#                  ^^^^^^^^^^ string.quoted.double.just constant.character.escape.just

backtick_code := `echo 'hello'`
#                ^ punctuation.section.interpolation.begin.just
#                             ^ punctuation.section.interpolation.end.just
#                ^^^^^^^^^^^^^^ meta.string.shell meta.interpolation.command.shell

# Just interpolation doesn't work inside backticks
backtick_no_interp := `echo {{single_backslash}}`
#                      ^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.shell meta.interpolation.command.shell - meta.interpolation.just

CUR_DIR_NAME := ```
#               ^^^ punctuation.section.interpolation.begin.just
basename `pwd`
#^^^^^^^^^^^^^ meta.string.shell meta.interpolation.command.shell
```

# This backtick evaluates the command `echo foo\necho bar\n`, which produces the value `foo\nbar\n`.
stuff := ```
# <- variable.other.just
#     ^^ keyword.operator.assignment.just
#        ^^^ meta.string.shell meta.interpolation.command.shell punctuation.section.interpolation.begin.just
    echo foo
    echo bar
#   ^^^^^^^^ meta.string.shell meta.interpolation.command.shell
  ```
# ^^^ meta.string.shell punctuation.section.interpolation.end.just

single_block_with_nested_quotes := '''
#                                  ^^^ string.quoted.single.block.just punctuation.definition.string.begin.just
  "Gentlemen," I said, "I've studied the maps
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.block.just
  And if what I'm thinking is right
'''
# <- string.quoted.single.block.just punctuation.definition.string.end.just
#^^ string.quoted.single.block.just punctuation.definition.string.end.just

double_block_with_nested_quotes := """
#                                  ^^^ string.quoted.double.block.just punctuation.definition.string.begin.just
  There's another new world at the top of the world
  For whoever can break through the ice"
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.block.just
  I looked round the room
# ^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.double.block.just
"""
# <- string.quoted.double.block.just punctuation.definition.string.end.just
#^^ string.quoted.double.block.just punctuation.definition.string.end.just

big_echo INPUT=("""
# <- meta.function.just entity.name.function.just - meta.function.parameters
#^^^^^^^ meta.function.just entity.name.function.just - meta.function.parameters
#        ^^^^^^^^^^ meta.function.parameters.just
#        ^^^^^ variable.parameter.just
#               ^^^ string.quoted.double.block.just punctuation.definition.string.begin.just
multiline
#^^^^^^^^ string.quoted.double.block.just
test
"""):
# <- string.quoted.double.block.just punctuation.definition.string.end.just
#^^ string.quoted.double.block.just punctuation.definition.string.end.just



######
# f-strings
######
name := "Yorke"

# Basic interpolation
greeting := f'Hello, {{name}}!'
#                    ^^ punctuation.section.interpolation.begin.just
#                      ^^^^ variable.other.just
#                          ^^ punctuation.section.interpolation.end.just

greeting := f"Hello, {{name}}!"
#                    ^^ punctuation.section.interpolation.begin.just
#                      ^^^^ variable.other.just
#                          ^^ punctuation.section.interpolation.end.just

# Escaped brace produces literal {{ — no interpolation
literal_braces := f'I {{{{love}}}} curly braces'
#                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.just string.quoted.single.just
#                 ^^punctuation.definition.string.begin.just
#                     ^^^^  constant.character.escape.just
#                                              ^  punctuation.definition.string.end.just

# Escaped brace immediately before a real interpolation
tricky := f'{{{{{{name}}}}}}'
#         ^^^^^^^^^^^^^^^^^^^ meta.string.just
#         ^^string.quoted.single.just punctuation.definition.string.begin.just
#           ^^^^string.quoted.single.just constant.character.escape.just
#               ^^ punctuation.section.interpolation.begin.just
#                 ^^^^ variable.other.just
#                     ^^ punctuation.section.interpolation.end.just
#                       ^^^^string.quoted.single.just
#                           ^string.quoted.single.just punctuation.definition.string.end.just

# Empty interpolation (degenerate case)
empty := f'before {{}} after'
#                 ^^ punctuation.section.interpolation.begin.just
#                   ^^ punctuation.section.interpolation.end.just
#                      ^^^^^ string.quoted.single.just

# Interpolation with a function call
home := f'Home is {{env("HOME")}}'

# Concatenation of format string with plain string
path := f'{{name}}' + '/suffix'
#       ^^ string.quoted.single.just punctuation.definition.string.begin.just
#         ^^ punctuation.section.interpolation.begin.just
#           ^^^^ variable.other.just
#               ^^ punctuation.section.interpolation.end.just
#                 ^ string.quoted.single.just punctuation.definition.string.end.just
#                   ^ keyword.operator.arithmetic.just
#                     ^ string.quoted.single.just punctuation.definition.string.begin.just
#                      ^^^^^^^ string.quoted.single.just
#                             ^ string.quoted.single.just punctuation.definition.string.end.just

# Nested quotes: double-quote chars inside single-quoted f-string
msg := f'He said "{{greeting}}" loudly'
#      ^^ string.quoted.single.just punctuation.definition.string.begin.just
#        ^^^^^^^^^ string.quoted.single.just
#                 ^^ punctuation.section.interpolation.begin.just
#                   ^^^^^^^^ variable.other.just
#                           ^^ punctuation.section.interpolation.end.just
#                             ^^^^^^^^ string.quoted.single.just
#                                     ^ string.quoted.single.just punctuation.definition.string.end.just

# Escape sequences are NOT processed in single-quoted f-strings
raw := f'\t\n{{name}}\r'
#      ^^ string.quoted.single.just punctuation.definition.string.begin.just
#        ^^^^ string.quoted.single.just
#                    ^^ string.quoted.single.just
#                      ^ string.quoted.single.just punctuation.definition.string.end.just

# Escape sequences ARE processed in double-quoted f-strings
escaped := f"\t\n{{name}}\r"
#          ^^ punctuation.definition.string.begin.just
#            ^^^^ string.quoted.double.just constant.character.escape.just
#                ^^ punctuation.section.interpolation.begin.just
#                  ^^^^ variable.other.just
#                      ^^ punctuation.section.interpolation.end.just
#                        ^^ string.quoted.double.just constant.character.escape.just
#                          ^ string.quoted.double.just punctuation.definition.string.end.just

# Multiple interpolations in one string
full_name := f'{{first}} {{last}}'
#              ^^^^^^^^^ meta.string.just meta.interpolation.just
#                        ^^^^^^^^ meta.string.just meta.interpolation.just

# Block single-quoted: no escape processing
block_single := f'''line one\nstill line one\n{{name}}'''
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.just
#               ^^^^ punctuation.definition.string.begin.just
#                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted.single.block.just - constant.character.escape.just
#                                             ^^ punctuation.section.interpolation.begin.just
#                                               ^^^^ variable.other.just
#                                                   ^^ punctuation.section.interpolation.end.just
#                                                     ^^^ punctuation.definition.string.end.just

# Block double-quoted: escape processing active
block_double := f"""line one\nline two\n{{name}}"""
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.just
#               ^^^^ punctuation.definition.string.begin.just
#                   ^^^^^^^^^^^^^^^^^^^^ string.quoted.double.block.just
#                           ^^ constant.character.escape.just
#                                     ^^ constant.character.escape.just
#                                       ^^ punctuation.section.interpolation.begin.just
#                                         ^^^^ variable.other.just
#                                             ^^ punctuation.section.interpolation.end.just
#                                               ^^^ punctuation.definition.string.end.just

# Interpolation at the very start and end of string
bookended := f'{{open}}middle{{close}}'
#            ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.just
#              ^^ punctuation.section.interpolation.begin.just
#                ^^^^ variable.other.just
#                    ^^ punctuation.section.interpolation.end.just
#                      ^^^^^^ string.quoted.single.just
#                            ^^ punctuation.section.interpolation.begin.just
#                              ^^^^^ variable.other.just
#                                   ^^ punctuation.section.interpolation.end.just

# Only escaped braces, no real interpolations
only_escaped := f'{{{{}}}}{{{{}}}}{{{{}}}}{{{{}}}}{{{{}}}}'
#               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.just string.quoted.single.just
#                 ^^^^ constant.character.escape.just
#                         ^^^^constant.character.escape.just
#                                 ^^^^ constant.character.escape.just
#                                         ^^^^ constant.character.escape.just
#                                                 ^^^^ constant.character.escape.just
