ActiveAdmin.register ProblemDetail do  
  controller { with_role :admin }
  
  form :partial => "form"
  
  show  do
    attributes_table :name, :created_at, :updated_at, :problem_category
    panel "Skills" do
      table_for problem_detail.skills do
        column "name" do |s|; s.name; end
        column "description" do |s|; s.description; end
      end
    end    
  end
end