within SpacecraftDynamics.OrbitalDynamics.Examples.ComponentUsage;

model Earth_and_Moon
  extends Modelica.Icons.Example;
  
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity) annotation(
    Placement(transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}})));
  Components.GravitationalForce Fgravity(m_a_ref = Earth.m, m_b_ref = Moon.m)  annotation(
    Placement(transformation(origin = {30, 29.5}, extent = {{-18, -8.5}, {18, 8.5}})));
  AstronomicalObjects.Earth Earth annotation(
    Placement(transformation(origin = {-30, -10}, extent = {{-30, -30}, {30, 30}})));
  AstronomicalObjects.Moon Moon annotation(
    Placement(transformation(origin = {70, 30}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(world.frame_b, Earth.frame_a) annotation(
    Line(points = {{-70, -10}, {-60, -10}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity.frame_a, Earth.frame_a) annotation(
    Line(points = {{12, 29.5}, {12, 29}, {-60, 29}, {-60, -10}}, color = {95, 95, 95}, thickness = 3));
  connect(Fgravity.frame_b, Moon.frame_a) annotation(
    Line(points = {{48, 30}, {60, 30}}, color = {95, 95, 95}, thickness = 3));
  annotation(
    experiment(StartTime = 0, StopTime = 2592000, Tolerance = 1e-06, Interval = 60));
end Earth_and_Moon;
