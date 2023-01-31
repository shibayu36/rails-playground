# frozen_string_literal: true

class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  # GET /users/:username/entries
  def index
    @entries = User.find_by!(name: params[:username]).recent_entries
  end

  # GET /users/:username/entries/1
  def show; end

  # GET /users/:username/entries/new
  def new
    @entry = diary_by_path.entries.build
  end

  # GET /entries/1/edit
  def edit; end

  # POST /users/:username/entries
  def create
    @entry = diary_by_path.entries.build(entry_params)

    if @entry.save
      redirect_to entry_url(params[:username], @entry), notice: 'Entry was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      redirect_to entry_url(@entry), notice: 'Entry was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy

    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    diary = diary_by_path

    @entry = diary.entries.find_by!(id: params[:id])
  end

  def diary_by_path
    diary = User.find_by!(name: params[:username]).diary
    raise ActiveRecord::RecordNotFound unless diary

    diary
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(:title, :body)
  end
end
