class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  def availability(starting, ending)
    sessions = FullcalendarEngine::Session.where(coach_id:self.id)
    booleans = []
    sessions.map do |s|
      unless starting.between?(s.starttime, s.endtime) || ending.between?(s.starttime, s.endtime) || (s.starttime - ending) * (starting - s.endtime) >= 0
        booleans.push(true)
      else
        booleans.push(false)
      end
    end
    !booleans.include? false
  end
end
