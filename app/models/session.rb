class Session < FullcalendarEngine::Session
  belongs_to :user

  def coach_name
    if self.coach_id
      "#{Coach.find(self.coach_id).firstname} #{Coach.find(self.coach_id).lastname}"
    else
      "Assign this session to a coach"
    end
  end

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