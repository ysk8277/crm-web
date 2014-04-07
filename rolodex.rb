class Rolodex

  attr_reader :contacts

  def initialize 
    @contacts = []
  end

  def add_contact(contact) 
    @contacts << contact
  end

  def find(contact_id)
    @contacts.find {|contact| contact.id == contact_id }
  end

  def remove_contact(contact)
    @contacts.delete(contact)
  end
  
end
