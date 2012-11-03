class WordFinder
  def find(letters)
    command = "grep '^[#{letters}]*$' /usr/share/dict/words | awk '{print length, $0}' | sort -nr | awk '{print $2}'"
    `#{command}`.split
  end
end
