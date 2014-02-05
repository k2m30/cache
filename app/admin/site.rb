ActiveAdmin.register Site do
  permit_params :name, :css, banner_attributes: [:code, :site_id, :_destroy]

  member_action :add_links, method: :post do
    begin
      site = Site.find(params[:id])
      redirect_to admin_sites_path, alert: :wrong_params if site.nil?
      site.externals.create(url: params[:external], internal: Internal.create(url: params[:internal]))
    rescue => e
      redirect_to admin_site_path(site), alert: e.message
      return
    end
    redirect_to admin_site_path(site)
  end

  collection_action :links, method: :get do
    respond_to do |format|
      format.json { render json: External.all.pluck(:url), status: :ok }
    end
  end

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
    panel :new_links do
      render 'panel'
    end

    panel :links do
      table_for site.externals.order(updated_at: :desc) do
        column :url do |external|
          link_to external.url, external.url
        end
        column :internal do |external|
          link_to external.internal.url, external.internal.url if external.internal.present?
        end
        column :edit do |external|
          link_to :edit_links, edit_admin_external_path(external)
        end
        column :delete_links do |external|
          link_to :delete_links, admin_external_path(external), method: :delete
        end
      end
    end

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
