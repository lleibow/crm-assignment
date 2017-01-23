require './contact.rb'

class CRM

  def initialize
    main_menu
  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    if user_selected == 1
      add_new_contact
    elsif user_selected == 2
      modify_existing_contact
    elsif user_selected == 3
      delete_contact
    elsif user_selected == 4
      display_all_contacts
    elsif user_selected == 5
      search_by_attribute
    elsif user_selected == 6
      exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts 'provide contact id'
    contact_id = gets.to_i
    contact = Contact.find(contact_id)
    puts '[1] Modify First Name'
    puts '[2] Modify Last Name'
    puts '[3] Modify Email'
    puts '[4] Modify Note'
    puts 'enter a number'
    selection = gets.to_i
    if selection == 1
      puts "enter mod"
      contact.update("first name", attribute = gets.chomp)
      contact.display
    elsif selection == 2
      puts "enter mod"
      contact.update("last name", attribute = gets.chomp)
      contact.display
    elsif selection == 3
      puts "enter mod"
      contact.update("email", attribute = gets.chomp)
      contact.display
    elsif selection == 4
      puts "enter mod"
      contact.update("note", attribute = gets.chomp)
      contact.display
    end
  end

  def delete_contact
    puts 'provide contact id'
    contact_id = gets.to_i
    contact = Contact.find(contact_id)
    contact.delete
    puts "contact removed"
  end

  def display_all_contacts
    Contact.all.each do |contact|
      contact.display
    end
  end

  def search_by_attribute
    puts '[1] Search by id'
    puts '[2] Search by First Name'
    puts '[3] Search by Last Name'
    puts '[4] Search by Email'
    puts '[5] Search by Note'
    puts 'enter a number'
    attribute = gets.to_i
    if attribute == 1
      puts "enter querie"
      contact = Contact.find_by("id", value = gets.chomp.to_i)
      contact.display
    elsif attribute == 2
      puts "enter querie"
      contact = Contact.find_by("first name", value = gets.chomp)
      contact.display
    elsif attribute == 3
      puts "enter querie"
      contact = Contact.find_by("last name", value = gets.chomp)
      contact.display
    elsif attribute == 4
      puts "enter querie"
      contact = Contact.find_by("email", value = gets.chomp)
      contact.display
    elsif attribute == 5
      puts "enter querie"
      contact = Contact.find_by("note", value = gets.chomp)
      contact.display
    end
  end


 end

CRM.new
