class Rolodex

  attr_reader :contacts

  def initialize 
    @contacts = []
  end

  def create_contact(contact) 
    @contacts << contact
  end
end
