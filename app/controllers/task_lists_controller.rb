class TaskListsController < ApplicationController
  require "time"
  before_action :set_task_list, only: [:show, :edit, :update, :destroy]

  # GET /task_lists
  # GET /task_lists.json
  def index
    @task_lists = TaskList.all.order(start_date: :asc)
  end

  # GET /task_lists/1
  # GET /task_lists/1.json
  def show
  end

  # GET /task_lists/new
  def new
    @task_list = TaskList.new
  end

  # GET /task_lists/1/edit
  def edit
  end

  # POST /task_lists
  # POST /task_lists.json
  def create
    @task_list = TaskList.new(task_list_params)

    respond_to do |format|
      if @task_list.save

        # metodo para enviar un correo cuando se guarda un nuevo elemento de la lista con correo
        if @task_list.email != '' 
          #EmailNotifierJob.set(run_at: @task_list.start_date).perform_later(@task_list.title, @task_list.email, @task_list.start_date, @task_list.end_date)
        end
        


        format.html { redirect_to @task_list, notice: 'Lista de tareas creada correctamente.' }
        format.json { render :show, status: :created, location: @task_list }
      else
        format.html { render :new }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_lists/1
  # PATCH/PUT /task_lists/1.json
  def update
    respond_to do |format|
      if @task_list.update(task_list_params)
        format.html { redirect_to @task_list, notice: 'Lista de tareas modificada correctamente.' }
        format.json { render :show, status: :ok, location: @task_list }
      else
        format.html { render :edit }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_lists/1
  # DELETE /task_lists/1.json
  def destroy
    @task_list.destroy
    respond_to do |format|
      format.html { redirect_to task_lists_url, notice: 'Lista de tareas eliminada correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_list
      @task_list = TaskList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_list_params
      params.require(:task_list).permit(:title, :start_date, :end_date, :email)
    end
end
