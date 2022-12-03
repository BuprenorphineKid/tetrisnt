class Goal

  X_VALS = [0, 63, 126, 189, 252, 315, 378, 441]

  Y_VALS = [0, 63, 126, 189, 252, 315, 378, 441, 504, 567, 630, 693, 756, 819, 882]

  def determine_slot
    raise "NotImplementedError"
  end
end
