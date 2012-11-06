ActiveAdmin.register Certificate do
  
  form do |f|
    f.buttons        
    f.inputs "Details" do
      f.input :name
    end
    
    f.inputs do        
      f.input :skills, :collection => Skill.all.map { |skill| [skill.name, skill.id] }, :as => :check_boxes
    end
    
    f.buttons
  end

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
