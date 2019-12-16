class Reporte < Prawn::Document

def initialize(empleados)
  super(top_margin: 70)
  @empleados = empleados
  titulo
  line_items
end
def titulo
  text "Empleados", size: 28, style: :bold, align: :center
end
def line_items
  move_down 20
  table line_item_rows do
  row(0).font_style = :bold
  columns(1..3).aling = :rigth
  rows(1..3).width = 130
  self.row_colors = ["DDDDDD","FFFFFF"]
  self.header = true
  end
end
def line_item_rows
  [["Nombre","Apellido Paterno", "Apellido Materno", "Fecha de Nacimiento"]] +
  @empleados.map do |item|
    [item.strnombre,item.strapellidopaterno,item.strapellidomaterno,item.dtefechanacimiento]
  end
end
end
