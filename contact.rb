class Contact

  @@counter = 1000

  attr_accessor :id, :first_name, :last_name, :email, :notes

  def initialize (id, first_name, last_name, email, notes) 
    
    @id = Contact.get_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
  end

  def to_s
    "\nID: #{@id}\nFirst Name: #{@first_name}\nLast Name: #{@last_name}\nEmail: #{@email}\nNotes: #{@notes}"
  end

  def self.get_id
    @@counter += 1
    @@counter
  end
end