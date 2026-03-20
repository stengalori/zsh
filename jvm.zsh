
_jvm() {
  local cmd="${1:-help}"
  local version="$2"

  case "$cmd" in
  install) _jvm_install "$version" ;;
  use) _jvm_use "$version" ;;
  uninstall) _jvm_uninstall "$version" ;;
  list) _jvm_list ;;
  *) _jvm_help ;;
  esac
}

_jvm_install() {
  local version="$1"
  if [[ -z "$version" ]]; then
    echo "Usage: jvm install <version>"
    return 1
  fi

  echo "Installing OpenJDK $version via Homebrew..."
  brew install "openjdk@$version"
}

_jvm_use() {
  local version="$1"

  if [[ -z "$version" ]]; then
    echo "Usage: jvm use <version>"
    return 1
  fi

  if ! brew list --versions "openjdk@$version" >/dev/null 2>&1; then
    echo "openjdk@$version is not installed. Run: jvm install $version"
    return 1
  fi

  brew unlink openjdk@* >/dev/null 2>&1
  brew link --force --overwrite "openjdk@$version"

  local actual_version="$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')"
  local actual_major="${actual_version%%.*}"

  if [[ "$actual_major" != "$version" ]]; then
    echo "Error: Java major version mismatch. Expected $version, but got $actual_major"
    return 1
  fi

  echo "Now using openjdk@$version ($actual_version)"
}

_jvm_uninstall() {
  local version="$1"
  if [[ -z "$version" ]]; then
    echo "Usage: jvm uninstall <version>"
    return 1
  fi
  echo "Uninstalling openjdk@$version"
  brew uninstall "openjdk@$version"
}

_jvm_list() {
  echo "Installed OpenJDK versions:"
  ls -1 /opt/homebrew/opt 2>/dev/null | /usr/bin/grep '^openjdk@' || echo "No OpenJDK versions installed."
}

_jvm_help() {
  cat <<'EOF'
Fake jvm (Homebrew-based)
Usage: jvm <command> <version>
Commands:
  install <version>   Install openjdk@version
  use <version>       Use openjdk@version (adjust PATH)
  uninstall <version> Uninstall openjdk@version
  list                List installed OpenJDK versions
EOF
}

