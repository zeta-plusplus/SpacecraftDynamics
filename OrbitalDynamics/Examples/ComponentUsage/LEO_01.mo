within SpacecraftDynamics.OrbitalDynamics.Examples.ComponentUsage;

model LEO_01
  extends Modelica.Icons.Example;
  
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity) annotation(
    Placement(transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}})));
  Components.GravitationalForce Fgravity(m_a_ref = Earth.m, m_b_ref = Spacecraft.m)  annotation(
    Placement(transformation(origin = {30, 32.5}, extent = {{-18, -8.5}, {18, 8.5}})));
  Components.Spacecraft00 Spacecraft annotation(
    Placement(transformation(origin = {78, 33}, extent = {{-14, -14}, {14, 14}})));
  AstronomicalObjects.Earth Earth annotation(
    Placement(transformation(origin = {-10, -10}, extent = {{-30, -30}, {30, 30}})));
equation
  connect(world.frame_b, Earth.frame_a) annotation(
    Line(points = {{-70, -10}, {-40, -10}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity.frame_a, Earth.frame_a) annotation(
    Line(points = {{12, 32.5}, {12, 33}, {-40, 33}, {-40, -10}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity.frame_b, Spacecraft.frame_a) annotation(
    Line(points = {{48, 32.5}, {58, 32.5}, {58, 33}, {64, 33}}, color = {95, 95, 95}, thickness = 3));
  annotation(
    experiment(StartTime = 0, StopTime = 4500, Tolerance = 1e-06, Interval = 1));
end LEO_01;
