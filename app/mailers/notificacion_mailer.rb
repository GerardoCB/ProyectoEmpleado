class NotificacionMailer < ApplicationMailer
  default from: "gerardobenitezu.u@gmail.com"
    def aviso(mensaje,linea)
      @mensaje = mensaje;
      @linea=linea
      mail to: "gerardobenitezu_u@hotmail.com", subject:"Excepción en aplicación Empleado"
    end
end
