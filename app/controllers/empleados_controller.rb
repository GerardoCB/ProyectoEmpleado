class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :edit, :update, :destroy]

  def index
    begin
      @empleados = Empleado.all
    rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
    redirect_to '/pagina_error'
    end
  end

  def show
  end

  def new
    begin
    @empleado = Empleado.new
  rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
    redirect_to '/pagina_error'
    end
  end

  def edit
  end

  def create
    begin
    @empleado = Empleado.new(empleado_params)
    respond_to do |format|
      if @empleado.save
        format.html { redirect_to @empleado, notice: 'Empleado se creo con exito.' }
        format.json { render :show, status: :created, location: @empleado }
      else
        format.html { render :new }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
    redirect_to '/pagina_error'
    end
  end

  def update
    begin
    respond_to do |format|
      if @empleado.update(empleado_params)
        format.html { redirect_to @empleado, notice: 'Empleado se actualizo con exito.' }
        format.json { render :show, status: :ok, location: @empleado }
      else
        format.html { render :edit }
        format.json { render json: @empleado.errors, status: :unprocessable_entity }
      end
    end
  rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
    redirect_to '/pagina_error'
    end
  end

  def destroy
    begin
    @empleado.destroy
    respond_to do |format|
      format.html { redirect_to empleados_url, notice: 'Empleado se elimino con exito.' }
      format.json { head :no_content }
    end
  rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
    redirect_to '/pagina_error'
    end
  end

  private
    def set_empleado
      begin
      @empleado = Empleado.find(params[:id])
    rescue Exception => e
    NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
    redirect_to '/pagina_error'
  end
    end

    def empleado_params
      begin
      params.require(:empleado).permit(:strnombre, :strapellidopaterno, :strapellidomaterno, :dtefechanacimiento)
    rescue Exception => e
          NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
          redirect_to '/pagina_error'
        end
    end
end
