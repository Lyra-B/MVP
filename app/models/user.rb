class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :sessions

  def administrator?
    true if self.type == "Administrator"
  end


  def availability(session)
    starting = session.starttime
    ending = session.endtime
    sessions = FullcalendarEngine::Session.where(coach_id:self.id)
    booleans = []
    sessions.map do |s|
      if starting.between?(s.starttime, s.endtime) ||
        ending.between?(s.starttime, s.endtime) ||
        (s.starttime - ending) * (starting - s.endtime) >= 0
        booleans.push(false)
      else
        booleans.push(true)
      end
    end
    !booleans.include? false
  end
end
