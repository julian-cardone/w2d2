class Room

def initialize(capacity)
    @capacity = capacity
    @occupants = []
end
    
attr_reader :capacity, :occupants

def full?
    return false if @occupants.length < @capacity
    return true if @occupants.length == @capacity
end

def available_space
    return @capacity - @occupants.length
end

def add_occupant(name)
    if full?
        return false
    else
        @occupants << name
        return true
    end
end


  
end