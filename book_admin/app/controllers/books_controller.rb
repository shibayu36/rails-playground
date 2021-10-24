class BooksController < ApplicationController
  protect_from_forgery except: [:destroy]

  before_action :detect_mobile_variant
  before_action :set_book, only: %i[show destroy]
  around_action :action_logger, only: [:destroy]

  def show
    respond_to do |format|
      format.html { render layout: 'application' }
      format.json
    end
  end

  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def action_logger
    logger.info 'around-before'
    yield
    logger.info 'around-after'
  end

  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ /iPhone/
  end
end
