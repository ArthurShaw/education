class PageContent < ActiveRecord::Base

  enum content_type:[:text, :json]

end
