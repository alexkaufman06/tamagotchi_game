class Tamagotchi < ActiveRecord::Base
   before_create :set_initial_levels

   def time_passes days
     self.food_level = self.food_level - (1 * days)
     self.activity_level = self.activity_level - (1 * days)
     self.sleep_level = self.sleep_level - (1 * days)
     self.save
   end

   def is_alive?
     food = self.food_level > 0
     sleep = self.sleep_level > 0
     activity = self.activity_level > 0
     food && sleep && activity
   end

  def feed amount
    if (self.food_level + amount) > 11
      self.food_level = 11
    else
      self.food_level = self.food_level + amount
    end
    self.save
  end

   def sleep amount
     if (self.sleep_level + amount) > 11
       self.sleep_level = 11
     else
       self.sleep_level = self.sleep_level + amount
     end
     self.save
   end

   def play amount
     if (self.activity_level + amount) > 11
       self.activity_level = 11
     else
       self.activity_level = self.activity_level + amount
     end
     self.save
   end

private
  def set_initial_levels
    self.food_level = 11
    self.activity_level = 11
    self.sleep_level = 11
  end
end
