function extract --description 'Does what is says on the tin.'
  set --local ext (echo $argv[1] | awk -F. '{print $NF}')
  switch $ext
    case "tar.bz2"
        tar xjf $argv[1]
    case "tar.gz"
        tar xzf $argv[1]
    case "bz2"
        bunzip2 $argv[1]
    case "rar"
        unrar x $argv[1]
    case "gz"
        gunzip $argv[1]
    case "tar"
        tar xf $argv[1]
    case "tbz2"
        tar xjf $argv[1]
    case "tgz"
        tar xzf $argv[1]
    case "zip"
        unzip $argv[1]
    case "Z"
        uncompress $argv[1]
    case "7z"
        7z x $argv[1]
    case "*"
        echo "'$argv[1]' cannot be extracted via extract()"
    case '*'
      echo "unknown extension"
  end
end
