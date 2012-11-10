ActiveAdmin.register Certificate do
  form :partial => "form"

  show  do
    attributes_table :name, :created_at, :updated_at
    panel "Skills" do
      table_for certificate.skills do
        column "name" do |s|; s.name; end
        column "description" do |s|; s.description; end
      end
    end    
  end
  
end
