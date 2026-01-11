SPACE_HELP="  dn       edit devnotes
  yumc     compile and run <name>
  yute     run tests
  yumcp    sync + build + jump
  yump     jump to pi
  ypull    pull outputs
  cb       cargo build
  cbs      cargo buils silent (no warns, only errors)
  "

alias dn="$EDITOR ~/programming_projects/minicompiler/notes/DEVNOTES.md"
alias cb="cargo build"
alias cbs="RUSTFLAGS='-A warnings' cargo build"
