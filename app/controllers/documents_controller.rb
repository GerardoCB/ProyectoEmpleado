class DocumentsController < ApplicationController

  def reporte_pdf
    begin
      @empleados = Empleado.all

        if @empleados.count <=0
        else
          respond_to do |format|
          format.html
          format.pdf do
          pdf = Reporte.new(@empleados)
          send_data pdf.render, filename:"reporte.pdf",
          type: "application/pdf",
          disposition: "inline"
        end
      end
    end
    rescue Exception => e
      NotificacionMailer.aviso(e.message,e.backtrace.inspect).deliver
      redirect_to '/pagina_error'
    end
  end

  def pagina_error

  end

end
