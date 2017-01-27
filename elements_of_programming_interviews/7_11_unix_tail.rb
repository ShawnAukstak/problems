#Mimic Unix Command line utility - takes filename number of lines
#Displays last number of lines in file

def unix_tail_command_brute(filename, lines)
  lines_total, output = 0, ""

  file = File.open(filename,'r')
  file.each_line do |l|
    lines_total += 1
  end
  file.close

  start_line = lines_total - lines

  line_number = 0
  file = File.open(filename,'r')
  file.each_line do |l|

    if line_number >= start_line
      output << "#{l}"
    end
    line_number += 1
  end
  file.close

  output
end

def unix_tail_command(filename, line)
  output = ""

  file = File.open(filename, 'r')

  file.seek(-1, IO::SEEK_END)
  line_total = 0

  char = file.getc
  while(char && line_total < line)
    output.prepend char

    if char == "\n"
      line_total +=1
    end

    file.seek(-2, IO::SEEK_CUR)
    char = file.getc

  end

  file.close
  output
end

filename = ARGV[0]
lines = ARGV[1].to_i
puts unix_tail_command_brute(filename, lines)
puts unix_tail_command(filename, lines)