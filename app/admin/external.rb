ActiveAdmin.register External do

  controller do
    def destroy
      external = External.find(params[:id])
      site = external.site
      return if external.nil?
      external.destroy
      redirect_to admin_site_path(site)
    end
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
