class Rolodex


  def initialize 
    @contacts = []
  end

  def create_contact
    contact = Contact.new
    @contacts << contact
    puts "\e[H\e[2J"
    puts contact
    sleep (0.2)
    puts "\nNew contact created...\n\n"
  end
  
  def modify_contact   #validation of input ID
    puts "Enter contact ID:"
    @id = gets.chomp.to_i
    
    @contacts.each do |contact|
      if contact.id == @id
        puts "\e[H\e[2J"
        puts "Current values:"
        sleep (0.2)
        puts contact
        modify_contact_attribute 
        return #ends method with last value       
      end
    end
    puts "\nCould not find contact ID.\n\n"
    return #ends method last value
  end

  def modify_contact_attribute
    sleep (0.2)
    puts "\nSelect attribute to change:\n\n"
    puts "1. First name"
    puts "2. Last name"
    puts "3. Email"
    puts "4. Notes"
    puts "5. Modify another contact"
    puts "6. Delete a contact"   
    puts "7. Back to Main menu\n\n"
    user_input = gets.chomp.to_i
    if user_input == 1
      modify_first_name
    elsif user_input == 2
      modify_last_name
    elsif user_input == 3
      modify_email
    elsif user_input == 4
      modify_notes
    elsif user_input == 5
      puts "\e[H\e[2J"
      modify_contact
    elsif user_input == 6
      delete_contact
    elsif user_input == 7
      puts "\e[H\e[2J"
      return
    else 
      sleep (0.2)
      puts "Invalid entry."
      modify_contact_attribute
    end
  end

  def modify_first_name
    puts "Enter new first name:"
    new_first_name = gets.chomp.to_s.downcase.capitalize
    puts "Confirm(Y/N):"
    user_input = gets.chomp.to_s.downcase
    if user_input == "y"
      @contacts.each do |contact|
        if contact.id == @id
          contact.first_name = new_first_name
          puts "\e[H\e[2J"
          puts "New values:"
          sleep (0.2)
          puts contact
          modify_contact_attribute
        end
      end
    elsif 
      user_input == "n"
      modify_contact_attribute
    else
      puts "Invalid entry."
      modify_contact_attribute
    end
  end
  
  def modify_last_name
    puts "Enter new last name:"
    new_last_name = gets.chomp.to_s.downcase.capitalize
    puts "Confirm(Y/N):"
    user_input = gets.chomp.to_s.downcase
    if user_input == "y"
      @contacts.each do |contact|
        if contact.id == @id
          contact.last_name = new_last_name
          puts "\e[H\e[2J"
          puts "New values:"
          sleep (0.2)
          puts contact
          modify_contact_attribute
        end
      end
    elsif 
      user_input == "n"
      modify_contact_attribute
    else
      puts "Invalid entry."
      modify_contact_attribute
    end
  end
  def modify_email
    puts "Enter new email:"
    new_email = gets.chomp.to_s
    puts "Confirm(Y/N):"
    user_input = gets.chomp.to_s.downcase
    if user_input == "y"
      @contacts.each do |contact|
        if contact.id == @id
          contact.email = new_email
          puts "\e[H\e[2J"
          puts "New values:"
          sleep (0.2)
          puts contact
          modify_contact_attribute
        end
      end
    elsif 
      user_input == "n"
      modify_contact_attribute
    else
      puts "Invalid entry."
      modify_contact_attribute
    end
  end
  
  def modify_notes
    puts "Enter new notes:"
    new_notes = gets.chomp.to_s
    puts "Confirm(Y/N):"
    user_input = gets.chomp.to_s.downcase
    if user_input == "y"
      @contacts.each do |contact|
        if contact.id == @id
          contact.notes = new_notes
          puts "\e[H\e[2J"
          puts "New values:"
          sleep (0.2)
          puts contact
          modify_contact_attribute
        end
      end
    elsif 
      user_input == "n"
      modify_contact_attribute
    else
      puts "Invalid entry."
      modify_contact_attribute
    end
  end

  def delete_contact 
    puts "Delete this contact(Y/N):"
    user_input = gets.chomp.to_s.downcase
    if user_input == "y"
      @contacts.delete_if{|c| c.id==@id} #look up
      puts "\e[H\e[2J" 
      sleep (0.2)
      puts "\nContact deleted...\n\n"
    elsif user_input =="n"
      modify_contact_attribute
    else
      puts "Invalid entry."
      modify_contact_attribute
    end
  end

  def display_all_contacts
    puts "All contacts\n------------"
    @contacts.each do |contact|
      puts contact
    end
    puts ""
  end

  def display_contacts_by_attribute
    sleep (0.2)
    puts "\nSelect attribute to display:\n\n"
    puts "1. First name"
    puts "2. Last name"
    puts "3. Email"
    puts "4. ID"
    puts "5. Back to Main menu\n\n"
    user_input = gets.chomp.to_i
    if user_input == 1
      display_by_first_name
    elsif user_input == 2
      display_by_last_name
    elsif user_input == 3
      display_by_email
    elsif user_input == 4
      display_by_id
    elsif user_input == 5
      puts "\e[H\e[2J"
      return
    else 
      sleep (0.2)
      puts "Invalid entry."
      display_contacts_by_attribute
    end
  end

  def display_by_first_name
    puts "Enter first name:"
    user_input = gets.chomp.to_s.downcase.capitalize
    puts "\e[H\e[2J"
    puts "Found following result(s):"
    @contacts.each do |contact|
      if contact.first_name == user_input
        puts contact
      end
    end
    puts ""
  end

  def display_by_last_name
    puts "Enter last name:"
    user_input = gets.chomp.to_s.downcase.capitalize
    puts "\e[H\e[2J"
    puts "Found following results:"
    @contacts.each do |contact|
      if contact.last_name == user_input
        puts contact
      end
    end
    puts ""
  end

  def display_by_email
    puts "Enter email:"
    user_input = gets.chomp.to_s
    puts "\e[H\e[2J"
    puts "Found following results:"
    @contacts.each do |contact|
      if contact.email == user_input
        puts contact
      end
    end
    puts ""
  end

  def display_by_id
    puts "Enter ID:"
    user_input = gets.chomp.to_i
    puts "\e[H\e[2J"
    puts "Found following results:"
    @contacts.each do |contact|
      if contact.id == user_input
        puts contact
      end
    end
    puts ""
  end

end
