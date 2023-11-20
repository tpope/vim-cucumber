# vim-cucumber

This is the development version of Vim's included runtime files for the Ruby
acceptance testing framework [Cucumber](https://cucumber.io/). It provides
syntax highlighting, indenting, and some editing commands.

## Commands

vim-cucumber provides commands to jump from steps to step definitions in
feature files.

In normal mode, pressing `[<C-d>` or `]<C-d>` on a step jumps to the
corresponding step definition and replaces the current buffer. `<C-W>d` or
`<C-w><C-d>` on a step jumps to its definition in a new split buffer and moves
the cursor there. `[d` or `]d` on a step opens the step definition in a new
split buffer while maintaining the current cursor position.

## Installation

Install using your favorite package manager, or use Vim's built-in package
support:

    mkdir -p ~/.vim/pack/tpope/start
    cd ~/.vim/pack/tpope/start
    git clone https://tpope.io/vim/cucumber.git
