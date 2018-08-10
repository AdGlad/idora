class CollectionsController < ApplicationController
  before_action :set_collection, only: [:edit, :update, :show, :destroy]

def index
  @collections = Collection.paginate(page: params[:page], per_page: 5)
  #@collections = Collection.all
end
 
def create

  @collection=Collection.new(collection_params)
  #debugger
  #@collection.user_id=1
  @collection.user=User.first
  if @collection.save
     flash[:notice] = "Collection successfully saved"
     redirect_to collection_path(@collection)
  else
     render 'new'
   end

 
end
#
def new
  @collection = Collection.new
end

def edit
end
#
def show
end
#
def update
  if @collection.update(collection_params)
  flash[:notice] = "Collection successfully updated"
  redirect_to collection_path(@collection)
  else
    render 'new'
  end 
end
#
def destroy
  if @collection.destroy
    flash[:notice] = "Collection successfully deleted"
    redirect_to collections_path
  else
    render 'new'
  end
end

  private

  def collection_params
   params.require(:collection).permit(:collectionid, :description)
  end

  def set_collection
    @collection=Collection.find(params[:id])
  end
end

