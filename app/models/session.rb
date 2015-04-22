class Session < FullcalendarEngine::Session
  belongs_to :user
  has_many :assignments

  def coach_name
    if self.coach_id
      "#{Coach.find(self.coach_id).firstname} #{Coach.find(self.coach_id).lastname}"
    else
      "Assign this session to a coach"
    end
  end

  def send_invite
    Assignment.create(coach_id:self.coach_id, session_id:self.id)
  end

  def awaiting_confirmation?
    true if self.assignments.length != 0 && self.assignments.last.status == "waiting"
  end

  def accepted?
    true if self.assignments.length != 0 && self.assignments.last.accepted?
  end

  def declined?
    true if self.assignments.length != 0 && self.assignments.last.declined?
  end

  def assigned?
    true unless self.coach_id == nil || self.awaiting_confirmation? || self.declined?
  end

  def color_state
    if self.awaiting_confirmation?
      self.color = "#FABE4D"
    elsif self.assigned?
      self.color = "#4DFA90"
    else
      self.color = "#FF5468"
    end
    self.color
  end
end