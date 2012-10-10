class ArticlesController < HighVoltage::PagesController
  layout false, :only => [:home]
end
