class Showing < ActiveRecord::Base
has_many :tickets
has_many :users,through: :tickets


def rating
  if min_age == 17
    "R"
  elsif min_age == 13
    "PG-13"
  else
    "PG"
  end
end

def showtime
  time.strftime('%m/%d/%Y at %I:%M %p')
end






end
