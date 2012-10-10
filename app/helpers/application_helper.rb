module ApplicationHelper
  def auto_page_class_names
    [params[:controller], params[:action], params[:id]].compact.map{ |n| n.split('/') }.flatten
  end
end
