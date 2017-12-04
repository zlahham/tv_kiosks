RailsAdmin.config do |config|
  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancancan ==
  config.authorize_with :cancan
  # config.authorize_with :cancancan

  # config.model Post do
  #   field :title
  #   field :content, :text, :ckeditor
  # end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
