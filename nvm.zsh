_nvm() {
  local cmd="${1:-help}"
  local version="$2"

  case "$cmd" in
  install) _nvm_install "$version" ;;
  use) _nvm_use "$version" ;;
  uninstall) _nvm_uninstall "$version" ;;
  list) _nvm_list ;;
  *) _nvm_help ;;
  esac
}

_nvm_install() {
  local version="$1"

  if [[ -z "$version" ]]; then
    echo "Usage: nvm install <version>"
    return 1
  fi

  brew install "node@$version"
}

_nvm_use() {
  local version="$1"

  if [[ -z "$version" ]]; then
    echo "Usage: nvm use <version>"
    return 1
  fi

  if ! brew list --versions "node@$version" >/dev/null 2>&1; then
    echo "node@$version is not installed. Run: nvm install $version"
    return 1
  fi

  brew unlink node@* >/dev/null 2>&1
  brew link --force --overwrite "node@$version"

  local actual_version="$(node -v 2>/dev/null | sed 's/^v//')"
  local actual_major="${actual_version%%.*}"

  if [[ "$actual_major" != "$version" ]]; then
    echo "Error: Node version mismatch. Expected $version, but got $actual_major"
    return 1
  fi

  echo "Now using node@$version ($actual_version)"
}

_nvm_uninstall() {
  local version="$1"

  if [[ -z "$version" ]]; then
    echo "Usage: nvm uninstall <version>"
    return 1
  fi

  echo "Uninstalling node@$version"
  brew uninstall "node@$version"
}

_nvm_list() {
  echo "Installed node versions:"
  ls -1 /opt/homebrew/opt | /usr/bin/grep node@
}

_nvm_help() {
  echo "Fake nvm (Homebrew-based)"
  echo "Usage: nvm <command> <version>"
  echo "Commands:"
  echo "  install <version>   Install node@version"
  echo "  use <version>       Use node@version (adjust PATH)"
  echo "  uninstall <version> Uninstall node@version"
  echo "  list                List installed node versions"
}

