
class ReviewsController < ApplicationController

  layout false

  def new
    @review = Review.new
    authorize! :new, @review
  end

end

