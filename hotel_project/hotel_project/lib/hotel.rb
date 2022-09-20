require_relative "room"
require 'byebug'

class Hotel

def initialize(name, hash)
    @name = name
    @rooms = Hash.new
    hash.each {|k, v| @rooms[k] = Room.new(v)}
end

def name
    cap = @name.split(" ").map {|ele| ele.capitalize}
    cap.join(" ")
end

attr_reader :rooms

def room_exists?(name)
    return true if @rooms.keys.include?(name)
    false
end

def check_in(person, room)
    if room_exists?(room)
        if Room.add_occupant(person)
            puts 'check in successful'
        else
        puts "sorry, room is full"
        end
    else puts "sorry, room does not exists"
    end
end

end

#p Hotel.new("hilbert's grand hotel", "Basement"=>4, "Attic"=>2, "Under the Stairs"=>1)