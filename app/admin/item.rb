ActiveAdmin.register Item do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do 
    column :name, :sortable => :name do |item| 
      link_to item.name, [:edit_admin, item]
    end

    column :categories do |item| 
      table_for item.categories.order('name ASC') do 
        column do |category| 
          link_to category.name, [:admin, category]
        end
      end
    end
    actions
  end
  
  show do 
    attributes_table do 
      row :name
      table_for item.categories.order('name ASC') do 
        column "Categories" do |category| 
          link_to category.name, [:admin, category]
        end
      end
    end
  end

  form do |f| 
    f.inputs "Add/Edit Item" do 
      f.input :name
      f.input :categories, :as => :check_boxes
      f.submit
    end
  end
end
