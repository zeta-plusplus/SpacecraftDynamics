within SpacecraftDynamics.OrbitalDynamics.Components;

model Spacecraft00
  import units = Modelica.Units.SI;
  
  /******************************
  parameters
  ******************************/
  parameter units.Mass m_par = 10000;
  
  parameter units.Length r_0_abs_start=(6378.137 + 400)*10.0^3.0;
  parameter Real r_0_Phase_xyplane_start=0;
  
  parameter units.Velocity v_0_abs_start=7600;
  parameter Real v_0_Phase_xyplane_start=r_0_Phase_xyplane_start;
  
  
  parameter units.Position r_0_start[3]={cos(r_0_Phase_xyplane_start*Modelica.Constants.pi/180)*r_0_abs_start, sin(r_0_Phase_xyplane_start*Modelica.Constants.pi/180)*r_0_abs_start, 0.0};
  
  parameter units.Velocity v_0_start[3]={-1*sin(v_0_Phase_xyplane_start*Modelica.Constants.pi/180)*v_0_abs_start, cos(v_0_Phase_xyplane_start*Modelica.Constants.pi/180)*v_0_abs_start, 0.0};
  
  parameter units.Acceleration a_0_start[3]={0.0,0.0,0.0};
  
  
  /******************************
  internal variables
  ******************************/
  units.Mass m;
  
  /******************************
  internal objects
  ******************************/
  Modelica.Mechanics.MultiBody.Parts.Body Body(m = m_par, r_0(start = {r_0_start[1], r_0_start[2], r_0_start[3]}), v_0(start = {v_0_start[1], v_0_start[2], v_0_start[3]})) annotation(
    Placement(transformation(origin = {-9, 0}, extent = {{-10, -10}, {10, 10}})));
  
  /******************************
  interfaces
  ******************************/
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-16, -16}, {16, 16}}), iconTransformation(origin = {-40, 0}, extent = {{-16, -16}, {16, 16}})));
  Modelica.Blocks.Interfaces.RealOutput y_mass annotation(
    Placement(transformation(origin = {-106, 40}, extent = {{10, -10}, {-10, 10}}), iconTransformation(origin = {-50, 60}, extent = {{10, -10}, {-10, 10}})));


equation
  connect(frame_a, Body.frame_a) annotation(
    Line(points = {{-100, 0}, {-19, 0}}));
  m=m_par;
  y_mass = Body.m;
  
  
  
  
  annotation(
    defaultComponentName = "Spacecraft",
    Icon(graphics = {Text(origin = {0, -111}, extent = {{-60, 9}, {60, -9}}, textString = "%name"), Rectangle(origin = {0, -10}, fillColor = {0, 0, 255}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, extent = {{-40, 50}, {40, -50}}), Polygon(origin = {0, 55}, fillColor = {0, 0, 255}, pattern = LinePattern.None, fillPattern = FillPattern.VerticalCylinder, points = {{-10, 25}, {-40, -15}, {40, -15}, {10, 25}, {-10, 25}}), Polygon(origin = {0, -80}, fillPattern = FillPattern.VerticalCylinder, points = {{-5, 20}, {-21, -12}, {21, -12}, {5, 20}, {-5, 20}})}, coordinateSystem(preserveAspectRatio=false, extent = {{-40, -100}, {40, 80}})));
end Spacecraft00;