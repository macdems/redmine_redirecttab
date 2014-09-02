Redmine::Plugin.register :redmine_redirecttab do
  name 'RedirectTab plugin'
  author 'Maciej Dems'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://phys.p.lodz.pl/redmine'
  author_url 'https://phys.p.lodz.pl/redmine'

  settings :default => {
    'redirect_tab_name' => 'Redirect Tab',
    'redirect_custom_field' => 'redirect_tab'
  }, :partial => 'redmine_redirecttab/settings'

  # This plugin adds a project module
  # It can be enabled/disabled at project level (Project settings -> Modules)
  project_module :redirect_tab do
    permission :redirect_tab, :redmine_redirecttab => :index
  end

  # A new item is added to the project menu
  menu(:project_menu,
       :redmine_redirecttab,
       { :controller => 'redmine_redirecttab', :action => 'index' },
       :caption => Proc.new { Setting.plugin_redmine_redirecttab['redirect_tab_name'] },
       :if => Proc.new { !Setting.plugin_redmine_redirecttab['redirect_tab_name'].blank? })
end
