
class SpecRunnerController < ApplicationController
  
  def e2e
    authorize! :spec_runner, Manager.new
    render 'empty', :layout => 'spec_runner_e2e'
  end

  def all
    authorize! :spec_runner, Manager.new
    render 'empty', :layout => 'spec_runner_jasmine'
  end

  def which
    authorize! :spec_runner, Manager.new
    render 'empty', :layout => 'spec_runner_jasmine'
  end

end
