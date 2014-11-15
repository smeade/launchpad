class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :approve, :detail, :revert]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  def detail
    @similar = Comment.search @comment.body, operator: "or"
    respond_to do |format|
      format.js {}
    end
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST
  def approve
    @comment.status = @comment.status == 'approved' ? nil : 'approved'
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # POST
  def revert
    version = PaperTrail::Version.find(params[:version_id])
    @comment = version.reify

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.ip_address = request.remote_ip

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :user_id, :body, :category_name)
    end
end
