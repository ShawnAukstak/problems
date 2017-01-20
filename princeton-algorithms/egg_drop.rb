class EggDrop
  POINT_BREAK = 10

  def initialize(stories)
    @stories = stories
  end

  def limit_break(story)
    toss_attempt = @stories / 2

    if toss(toss_attempt)
      limit_break(story)
    else
      
    end

  end

  #Returns true if egg breaks, false otherwise
  def toss(story)
    puts 'toss!';
    story / 2
    return story >= POINT_BREAK
  end
end

puts EggDrop.new(20).limit_break