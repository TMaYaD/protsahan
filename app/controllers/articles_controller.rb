class ArticlesController < HighVoltage::PagesController
  layout :get_layout

private
  def get_layout
    return 'skeleton' if ['home'].include? params[:id]
    return 'articles'
  end
end
