ActiveAdmin.register ProblemRequest do
  
  show  do
    attributes_table :id, :full_name, :email, :phone, :zip, :description, :latitude, :longitude
    panel "Problem Details" do
      table_for problem_request.details do
        column "name" do |s|; link_to(s.name, admin_problem_detail_path(s)); end
        column "description" do |s|; s.description; end
      end
    end    
  end  
end