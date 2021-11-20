class ConstraintsController < ApplicationController
  skip_before_action :authenticate

  layout 'constraints/layouts/constraints'

  def hoge
    p(request.mobile?)
    request.variant = :sp if request.smart_phone?

    p(domain1_constraints_hoge_path) # "/constraints/hoge"
    p(domain1_constraints_hoge_url) # "http://domain1.shibayu36.localhost:3000/constraints/hoge"
    p(domain2_constraints_hoge_path) # "/constraints/hoge"
    p(domain2_constraints_hoge_url) # "http://domain2.shibayu36.localhost:3000/constraints/hoge"
    p(constraints_fuga_path) # "/constraints/fuga"
    p(constraints_fuga_url) # "http://domain1.shibayu36.localhost:3000/constraints/fuga"
  end

  def fuga
    # redirect_to domain1_constraints_hoge_path # pathだけ変わる。ドメインはそのまま
    redirect_to domain1_constraints_hoge_url # domainも変わる
  end

  def piyo
    head :ok
  end
end
