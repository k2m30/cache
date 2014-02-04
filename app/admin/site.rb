ActiveAdmin.register Site do

  permit_params :name, :css, banner_attributes: [:code, :site_id, :_destroy]

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

  index do
    column :name
    column :css
    column :banner do |site|
      site.banner.code if site.banner.present?
    end
    column :externals do |site|
      site.externals.count
    end

    default_actions
  end

  show do
    attributes_table do
      row :css
      row :banner do |site|
        site.banner.code if site.banner.present?
      end
    end

  end

  form do |f|
    f.inputs 'Сайт' do
      f.input :name
      f.input :css
    end

    f.inputs 'Баннер' do
      f.inputs :for => [:banner, f.object.banner || Banner.new] do |nested|
        nested.input :code
      end

    end
    f.actions
  end

end
