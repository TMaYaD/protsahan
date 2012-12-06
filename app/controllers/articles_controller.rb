class ArticlesController < HighVoltage::PagesController
  layout :get_layout

private
  def get_layout
    return 'application' if ['home'].include? params[:id]
    return 'articles'
  end
end
