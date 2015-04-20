class Session < FullcalendarEngine::Session
  belongs_to :user

  def assigned?
    true unless self.coach_id == nil
  end

  def color_state
    if self.assigned?
      self.color = "#4DFA90"
    else
      self.color = "#FF5468"
    end
    self.color
  end
end