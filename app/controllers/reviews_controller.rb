class ReviewsController < ApplicationController
  RESULTS_PER_PAGE = 5


  before_action :set_review, only: %i[ show edit update destroy favorite unfavorite voted]
  
  before_action :authenticate_user!, only: %i[new create edit destroy update favorite unfavorite voted]
  
  # GET /reviews or /reviews.json
  def index
    @current_page = params[:page]&.to_i || 1
    @pages_count = (Review.count / RESULTS_PER_PAGE.to_f).ceil
    @reviews = Review.order('created_at DESC').limit(RESULTS_PER_PAGE).offset(RESULTS_PER_PAGE * (@current_page - 1))

  end

  def popular
      @reviews = Review.order('created_at DESC')
  end

  def voted
    @review.vote_by voter: current_user, vote: 'like', vote_scope: 'rank', vote_weight: params[:score]
    redirect_back fallback_location: root_path
  end

  def favorite
    
    if current_user.favorites.where(:id=>@review.id).blank?
      @review.TotalLiked += 1; 
      current_user.favorites << @review
    end
  redirect_back fallback_location: root_path
  end

  def unfavorite
    @review.TotalLiked -= 1; 
    current_user.favorites.delete(@review)
    redirect_back fallback_location: root_path
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    @reviews = Review.all
  end
  # GET /reviews/new
  def new
    @review = current_user.reviews.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = current_user.reviews.new(review_params)
    


    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])

    end
    
    # Only allow a list of trusted parameters through.
    def review_params

      params.require(:review).permit(:title, :category, :rich_description, :authors_grade)
    end
  end
