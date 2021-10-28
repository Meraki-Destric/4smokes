class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy library ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = current_user.books.build
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = current_user.books.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #Add and Remove books to/from library
  def library
    # Allows any variable type to pass through
    type  = params[:type]

    if type == "add"
      current_user.library_additions << @item
      redirect_to library_index_path, notice "#{@item.title} was added to the library"
    elsif type == "remove"
      current_user.library_additions.delete(@item)
      redirect_to library_index_path, notice "#{@item.title} was removed to the library"
    else
      redirect_to book_path(@book), notice "Looks like nothing happened"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:title, :description, :author, :user_id)
  end
end
