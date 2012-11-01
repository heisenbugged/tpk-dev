ActiveAdmin.register ProblemDetail do

  form do |f|
    f.inputs "Details" do
      f.input :name
    end

    f.inputs do        
      f.input :skills, :collection => Skill.all.map { |skill| [skill.name, skill.id] }, :as => :select
    end
    
    f.buttons
  end

  show  do
    panel "Details" do
      attributes_table :name, :created_at, :updated_at
    end
    
    panel "Skills" do
      table_for problem_detail.skills do
        column "name" do |s|; s.name; end
        column "description" do |s|; s.description; end
        #column :appointment_date
      end
    end
    
  end
  
end