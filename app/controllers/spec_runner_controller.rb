
class SpecRunnerController < ApplicationController

  layout 'spec_runner'
  
  def which
    authorize! :spec_runner, Manager.new
    
    case params[:w]
    when 'resources'
      @files = [ 'unit/resources_spec.js' ]
    else
      @files = [ 'e2e/scenarios.js' ]
    end

    render 'all'
  end

end
