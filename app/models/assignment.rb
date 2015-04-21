class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :coach
  belongs_to :administrator
  belongs_to :session

  before_create :set_default_status


  def set_default_status
    self.status = "waiting"
  end

  # def accepted?

  # end

  def accept_or_decline
    if accepted?
      self.status = "accepted"
    else
      self.status = "declined"
    end
  end
end
