class Ticket < ActiveRecord::Base
belongs_to :user
belongs_to :showing


  def buyticket
    if (user.age >= showing.min_age) && (user.money >= showing.cost) && (!user.showings.find {|show| show.showtime == showing.showtime})
      user.money = user.money - showing.cost
      user.save(validate: false)
      self.save
      "Success"
    elsif (user.age < showing.min_age)
       "Sorry, you don't meet the minimum age to buy this ticket"
    elsif (user.money < showing.cost)
       "Sorry, you don't have the credits to make this purchase"
     elsif user.showings.find {|show| show.showtime == showing.showtime}
       "You already have a ticket for a show at that time."
    end
  end

  def self.topuser
    group(:user_id).order("count(:user_id)").to_a[0].user_id
  end

end
