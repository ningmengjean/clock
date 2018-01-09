//Solution goes in Sources
import Foundation

struct Clock : Equatable, CustomStringConvertible {
    var hours: Int
    var minutes: Int
    
    init(hours: Int = 0, minutes: Int = 0) {
        self.hours   = hours
        self.minutes = minutes
        
        normalize()
    }
    
    var description: String {
        return String(format: "%02d:%02d", hours, minutes)
    }
    
    func add(minutes: Int) -> Clock {
        return Clock(hours: hours, minutes: self.minutes + minutes)
    }
    
    func subtract(minutes: Int) -> Clock {
        return add(minutes: -minutes)
    }
    
    mutating func normalize() {
        if minutes >= 60 {
            self.hours += minutes / 60
            self.minutes = minutes % 60
        }
        
        while minutes < 0 {
            self.hours -= 1
            self.minutes += 60
        }
        
        if hours >= 24 {
            self.hours = hours % 24
        }
        
        while hours < 0 {
            self.hours += 24
        }
    }
}

func ==(l: Clock, r: Clock) -> Bool {
    return (l.hours, l.minutes) == (r.hours, r.minutes)
}
