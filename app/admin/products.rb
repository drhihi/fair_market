ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :title, :description, :price, images: []

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :images, as: :file, input_html: { multiple: true }
    end
  end

  show do
    attributes_table do
      row :title
      row :description
      row :price
      row :images do |ad|
        ad.images.each do |image|
          div image_tag image.variant(:large)
        end
      end
    end
    active_admin_comments
  end
end
