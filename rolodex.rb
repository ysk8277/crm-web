class Rolodex

  attr_reader :contacts

  def initialize 
    @contacts = []
  end

  def create_contact(contact) 
    @contacts << contact
  end

  def find(contact_id)
    @contacts.find {|contact| contact.id == contact_id }
  end
end
