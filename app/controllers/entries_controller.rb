class EntriesController < ApplicationController
  respond_to :json

  def index
    respond_with Entry.all
  end
  def show
    respond_with Entry.find(params[:id])
  end
  def create
    respond_with Entry.create(entry_params)
  end
  def update
    respond_with Entry.update(params[:id], entry_params[:entry])
  end
  def destroy
    respond_with Entry.destroy(params[:id])
  end

  def new_winner
    q = Entry.order('RANDOM()').where(:winner => false)

    unless q.count == 0
      e = q.first
      e.winner = true
      e.save
      respond_with e
    else
      Entry.update_all(winner: false)
      e = q.first
      e.winner = true
      e.save
      respond_with Entry.all
    end
  end

  protected
  def entry_params
    params[:entry].permit(:id, :name, :winner)
  end
end
