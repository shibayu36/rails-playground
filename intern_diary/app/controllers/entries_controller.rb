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

    respond_to do |format|
      if @entry.save
        format.html { redirect_to entry_url(params[:username], @entry), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to entry_url(@entry), notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
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
