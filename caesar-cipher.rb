require 'pry-byebug'

def welcome
    puts "Welcome to the Caesar Cipher program made by Felipe Domingos!"
end

def get_text
    puts "Which text you want to encrypt?"
    puts "Note: use only letters\n"
    gets.chomp
end

def all_letters?(input)
    input.match?(/^[A-Za-z\s]+$/)
end

def get_direction
    puts "Which shift direction do you want?"
    gets.chomp
end

def direction_valid?(direction)
    ["right", "Right", "r", "R", "left", "Left", "l", "L", "RIGHT", "LEFT"].include?(direction)
end

def get_shift
    puts "How much would you like to shift the letters?"
    puts "Note: use only numbers\n"
    gets.chomp
end

def all_numbers?(input)
    input.match?(/^\d+$/)
end

def alphabet
    "abcdefghijklmnopqrstuvwxyz"
end

def shift_letter(letter, direction, shift)
    if ["RIGHT", "right", "Right", "r", "R"].include?(direction) then
        direction = +1
    elsif ["left", "Left", "l", "L", "LEFT"].include?(direction) then
        direction = -1
    else
        puts "Error"
    end

    current_index = alphabet.index(letter.downcase)

    new_index = current_index + (shift * direction)

    if new_index > 26 then
        new_index = new_index - 26
    end

    new_letter = alphabet[new_index]

    if letter == alphabet[current_index].upcase then
        new_letter.upcase
    else
        new_letter
    end
end

def shift_text(text, direction, shift) 
    shifted_text = text.split("").map { |letter| letter == " " ? " " : shift_letter(letter, direction, shift)}
    shifted_text.join("")
end
# ---
def main
    welcome
    
    text = get_text

    unless all_letters?(text)
        return puts "Error: Invalid Text"
    end

    puts "\n"
    
    direction = get_direction

    unless direction_valid?(direction)
        return puts "Error: Invalid Direction"
    end

    puts "\n"

    shift = get_shift

    unless all_numbers?(shift)
        return puts "Error: Invalid Shift"
    end

    puts "\n"

    puts shift_text(text, direction, shift.to_i)
end
main