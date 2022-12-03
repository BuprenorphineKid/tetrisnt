class GoalHandler

  attr_reader :goals, :loss

  def initialize(e_h)
    @e_h = e_h
    @goals = []
    @loss = false
  end

  def new_goal(block)
    @goals.push KillRow.new(block)
  end

  def needs_new?(block)
    potential = []
    
    @goals.each do |g|
      g.row.each do |s|
         potential.push s if s.equal?(block)
      end
    end

    return potential.empty?
  end

  def check_loss()
    @goals.each do |g|
      if g.ypos == 0
        @loss = true
      end
    end
  end 

  def update
    @e_h.active.each do |b|
      new_goal(b) if needs_new?(b)
    end

    check_loss()

    @goals.each do |g|
    end
  end
end
