class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :coach
  belongs_to :administrator
  belongs_to :session

  before_create :set_default_status

  validates :session_id, presence: true
  validates :coach_id, presence: true


  def set_default_status
    self.status = "waiting"
  end

  #methods that are used by the Session model to define the state of their assignments.

  def accepted?
    true if self.status == "accepted"
  end

  def declined?
    true if self.status == "declined"
  end
end
