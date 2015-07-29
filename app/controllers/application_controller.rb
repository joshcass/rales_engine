class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def show_all
    klass = get_class
    klass.all
  end

  def find_random
    klass = get_class
    klass.all.sample
  end

  def find_resource
    klass = get_class
    search_param = get_search_param
    if params[:id]
      klass.find(params[:id])
    elsif params[search_param].to_i == 0
      klass.find_one(search_param, params[search_param])
    else
      klass.find_by(search_param => params[search_param])
    end
  end

  def find_resources
    klass = get_class
    search_param = get_search_param
    if params[search_param].to_i == 0
      klass.find_all(search_param, params[search_param])
    else
      klass.where(search_param => params[search_param])
    end
  end

  private

  def get_class
    params[:controller].singularize.camelize.demodulize.constantize
  end

  def get_search_param
    params.symbolize_keys.keys.first
  end
end
