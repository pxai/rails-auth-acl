class AdminController< LoggedController
  before_filter :admin_only

  def index
  end
end
