require 'spec_helper'

describe Tamagotchi do
  describe '#initialize' do
    it 'creates a new tamagotchi with name and levels' do
      new_pet = Tamagotchi.create(:name => "Bob")
      expect(new_pet.name).to(eq("Bob"))
      expect(new_pet.food_level).to(eq(10))
      expect(new_pet.sleep_level).to(eq(10))
      expect(new_pet.activity_level).to(eq(10))
    end
  end

  describe "#time_passes" do
    it "decreases the amount of food the Tamagotchi has left by 1" do
      my_pet = Tamagotchi.create(:name => "lil dragon")
      my_pet.time_passes(1)
      expect(my_pet.food_level).to(eq(9))
    end
  end

  describe "#is_alive?" do
    it "is alive if the food level is above 0" do
      my_pet = Tamagotchi.create(:name => "squeeks")
      expect(my_pet.is_alive?).to(eq(true))
    end

    it "is dead if the food level is 0" do
      my_pet = Tamagotchi.create(:name => "Muffin Boots")
      my_pet.time_passes(10)
      expect(my_pet.is_alive?).to(eq(false))
    end
  end
end
