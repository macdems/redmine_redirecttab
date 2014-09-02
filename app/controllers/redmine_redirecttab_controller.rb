class RedmineRedirecttabController < ApplicationController
  unloadable

  def index
    project = Project.find(params[:id])
    url = project.custom_values.detect {|v| v.custom_field_id == Setting.plugin_redmine_redirecttab['redirect_custom_field'].to_i}
    if url
      redirect_to url.value
    end
  end
end
