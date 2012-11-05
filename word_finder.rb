class WordFinder
  def find(letters)
    command = "grep '^[#{letters}]*$' sowpods.txt | awk '{print length, $0}' | sort -nr | awk '{print $2}'"
    `#{command}`.split
  end
end
