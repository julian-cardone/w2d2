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
        if @rooms[room].add_occupant(person)
            puts 'check in successful'
        else
        puts "sorry, room is full"
        end
    else puts "sorry, room does not exists"
    end
end

def has_vacancy?
    @rooms.each do |k,v|
        if !v.full?
            return true
        end
    end
    return false
end

def list_rooms
    @rooms.each do |k,v|
        puts k + v.available_space.to_s
    end
end

end
