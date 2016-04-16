module Admin
  class PersonService
    include Godmin::Resources::ResourceService

    attrs_for_index :name, :gender, :age, :email, :established
    attrs_for_show :name, :gender, :age, :email, :established
    attrs_for_form :name, :gender, :age, :email, :established
  end
end
