class TerminalOutput
  def puts(line)
    $stdout.puts(line)
  end

  def clear
    system("clear")
  end
end
