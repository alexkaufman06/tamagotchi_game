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

   def feed
     self.food_level = self.food_level + 5
     self.save
   end

private
  def set_initial_levels
    self.food_level = 10
    self.activity_level = 10
    self.sleep_level = 10
  end
end
