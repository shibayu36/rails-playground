# frozen_string_literal: true

class Users::EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  # GET /users/entries or /users/entries.json
  def index
    @entries = Entry.all
  end

  # GET /users/entries/1 or /users/entries/1.json
  def show; end

  # GET /users/entries/new
  def new
    @entry = Entry.new
  end

  # GET /users/entries/1/edit
  def edit; end

  # POST /users/entries or /users/entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to users_entry_url(@entry), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/entries/1 or /users/entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to users_entry_url(@entry), notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/entries/1 or /users/entries/1.json
  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to users_entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.fetch(:entry, {})
  end
end
