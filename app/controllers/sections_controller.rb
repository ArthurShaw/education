class SectionsController < ApplicationController

  def show
    @section = Section.find(params[:id])
    render_404 unless @section
  end

end
