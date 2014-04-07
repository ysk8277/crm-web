class Contact

  @@counter = 1000

  attr_accessor :first_name, :last_name, :email, :notes, :id

  def initialize (first_name, last_name, email, notes, id) 
    @first_name = first_name
    @last_name = last_name
    @email = email
    @notes = notes
    @id = Contact.get_id
  end

  def self.get_id
    @@counter += 1
    @@counter
  end
end